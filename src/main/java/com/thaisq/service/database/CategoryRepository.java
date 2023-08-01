package com.thaisq.service.database;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.thaisq.model.Category;
@Repository
public interface CategoryRepository extends JpaRepository<Category, String>{

}
