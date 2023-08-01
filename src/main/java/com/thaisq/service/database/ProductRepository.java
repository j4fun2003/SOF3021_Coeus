package com.thaisq.service.database;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.thaisq.model.OrdersDetail;
import com.thaisq.model.Product;
@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>{
	Page<Product> findAllByCategoryIdLike(String category, Pageable pageable);
	
	@Query("SELECT o FROM Product o WHERE o.id=?1")
	Product findProductById(Integer id);
	
	@Query("SELECT p.name, od.quantity\n"
			+ "FROM Product p\n"
			+ "INNER JOIN OrdersDetail od ON p.id = od.product.id\n"
			+ "WHERE od.orders.id = ?1")
	List<Product> findBuyOrdersDetailByOrderId(int orderId);
	
}
