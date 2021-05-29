package com.manager.app.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.manager.app.models.CustomerOrderItem;
import com.manager.app.models.projection.GenericGenderCount;
import com.manager.app.models.projection.GenericProductCount;

public interface CustomerOrderItemRepository extends CrudRepository<CustomerOrderItem, Integer>{
	@Query(value="SELECT SUM(quantity) as Count, gender as Gender  FROM customer_order_items GROUP BY gender ORDER BY Count;", nativeQuery=true)
	List<GenericGenderCount> getGenderCount();
	
	@Query(value="SELECT SUM(quantity) as Count, type as Types FROM customer_order_items WHERE gender = ?1 GROUP BY type;", nativeQuery=true)
	List<GenericProductCount> getProductCount(String gender);
}
