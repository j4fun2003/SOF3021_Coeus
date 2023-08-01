package com.thaisq.controller;

import java.util.Date;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thaisq.model.Account;
import com.thaisq.model.Orders;
import com.thaisq.model.Product;
import com.thaisq.service.database.OrdersDetailRepository;
import com.thaisq.service.database.OrdersRepository;
import com.thaisq.service.database.ProductRepository;
import com.thaisq.service.session.SessionService;
import com.thaisq.service.shoppingCart.ShoppingCartServiceImplement;

@Controller
public class CartController {
	@Autowired
	ProductRepository productRepository;
	@Autowired
	ShoppingCartServiceImplement shoppingCart;
	@Autowired
	HttpServletRequest req;
	@Autowired
	SessionService sessionService;
	@Autowired
	OrdersRepository ordersRepository;
	@Autowired
	OrdersDetailRepository ordersDetailRepository;

	private static double newPrice;

	@ModelAttribute("shoppingCart")
	public ShoppingCartServiceImplement getShoppingCart() {
		return shoppingCart;
	}

	@RequestMapping("/home/cart")
	public String getCart(Model model, @RequestParam("errorQuantity") Optional<String> errorQuantityMessage,
			@RequestParam("buyMessage") Optional<String> buyMessage) {
//		model.addAttribute("shoppingCart", shoppingCart);
		String errorQuantityM = errorQuantityMessage.orElse("");
		String buyM = buyMessage.orElse("");
		model.addAttribute("newPrice", newPrice);
		model.addAttribute("errorQuantityMessage", errorQuantityM);
		model.addAttribute("buyMessage", buyM);
		return "home/cart";
	}

	@RequestMapping("/home/product-detail")
	public String getProductDetail(Model model, @RequestParam("id") Integer id) {
		Product product = productRepository.findProductById(id);
		newPrice = product.getPrice();
		if (product.getDiscount() > 0) {
			newPrice = product.getPrice() - (product.getPrice() * product.getDiscount() / 100);
		}
		model.addAttribute("newPrice", newPrice);
		model.addAttribute("product", product);
		return "home/product-detail";
	}

	@PostMapping("/home/cart/add/{id}")
	public String addProductToCart(RedirectAttributes redirectAttributes, @PathVariable("id") Integer id,
			@RequestParam("quantity") Integer quantity) {
		Product product = productRepository.findProductById(id);

		if (quantity <= product.getQuantity()) {
			shoppingCart.add(id, quantity);
		} else {
			redirectAttributes.addAttribute("errorQuantity", "Không đủ số lượng sản phẩm!");
		}

		return "redirect:/home/cart";
	}



	@RequestMapping("/home/cart/remove/{id}")
	public String removeProductFromCart(@PathVariable("id") Integer id) {
		shoppingCart.remove(id);
		return "redirect:/home/cart";
	}

	@RequestMapping("/home/cart/update/{id}")
	public String updateProductQuantity(@PathVariable("id") Integer id, @RequestParam("quantity") Integer quantity,
			RedirectAttributes redirectAttributes) {
		Product product = productRepository.findProductById(id);
		if (quantity <= product.getQuantity()) {
			shoppingCart.update(id, quantity);
		} else {
			redirectAttributes.addAttribute("errorQuantity", "Không đủ số lượng sản phẩm!");
		}
		return "redirect:/home/cart";
	}

	@RequestMapping("/home/cart/checkout")
	public String checkoutShoppingCart(Model model, @RequestParam("address") String address,
			@RequestParam("phonenumber") String phonenumber, @RequestParam("orderNote") String note,
			RedirectAttributes redirectAttributes) {
		try {
			Account currentUser = sessionService.getAttribute("user");
			double totalPrice = shoppingCart.getAmount() + shoppingCart.getTax() + shoppingCart.getShipping();
			Orders orders = new Orders();
			orders.setAccount(currentUser);
			orders.setCreateDate(new Date());
			orders.setAddress(address);
			orders.setPhonenumber(phonenumber);
			orders.setNote(note);
			orders.setStatus(1);
			orders.setPrice(totalPrice);
			ordersRepository.save(orders);
			shoppingCart.getProductsInShoppingCartInsertIntoOrderDetail(orders);
			redirectAttributes.addAttribute("buyMessage", "Thanh toán thành công");
		} catch (Exception ex) {
			ex.printStackTrace();
			redirectAttributes.addAttribute("buyMessage", "Thanh toán thất bại");
		}
		return "redirect:/home/cart";
	}
}
