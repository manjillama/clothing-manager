package com.manager.app.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.manager.app.models.CustomerOrder;
import com.manager.app.models.projection.MonthlyGenderSales;
import com.manager.app.models.projection.MonthlySales;

public interface CustomerOrderRepository extends CrudRepository<CustomerOrder, Integer>, PagingAndSortingRepository<CustomerOrder, Integer>{

	List<CustomerOrder> findByCustomerId(int id);

	Page<CustomerOrder> findById(Pageable pageable, int id);
	
	@Query("SELECT COUNT(e) FROM CustomerOrder e WHERE year(e.orderedDate) = year(current_date) and month(e.orderedDate) = month(current_date)")
	Long countOrdersOfCurrentMonth();
	
	@Query(value="SELECT\n" + 
			"    to_char(ordered_date, 'Mon') AS \"Month\",\n" + 
			"    sum(grand_total)\n" + 
			"FROM\n" + 
			"    customer_orders\n" + 
			"WHERE\n" + 
			"    date_part('year', ordered_date) = :year \n" + 
			"GROUP BY\n" + 
			"    \"Month\",\n" + 
			"    date_trunc('Month', ordered_date)\n" + 
			"ORDER BY\n" + 
			"    date_trunc('Month', ordered_date)", nativeQuery=true)
	List<MonthlySales> yearSales(@Param("year") int year);
	
	@Query(value="SELECT\n" + 
			"    to_char(co.ordered_date, 'Mon') AS \"Month\",\n" + 
			"    sum(coi.total_selling_price - coi.discount - coi.buying_price)\n" + 
			"FROM\n" + 
			"    customer_orders co\n" + 
			"    FULL JOIN customer_order_items coi ON (co.id = coi.customer_order_id)\n" + 
			"WHERE\n" + 
			"    date_part('year', ordered_date) = :year \n" + 
			"GROUP BY\n" + 
			"    \"Month\",\n" + 
			"    date_trunc('Month', ordered_date)\n" + 
			"ORDER BY\n" + 
			"    date_trunc('Month', ordered_date)", nativeQuery=true)
	List<MonthlySales> yearProfit(@Param("year") int year);
	
	@Query(value="SELECT\n" + 
			"    to_char(a.ordered_date, 'Mon') AS \"Month\",\n" + 
			"    sum(a.grand_total) AS \"Count\",\n" + 
			"    b.gender AS \"Gender\"\n" + 
			"FROM\n" + 
			"    customer_orders a\n" + 
			"    JOIN customer_order_items b ON (a.id = b.customer_order_id)\n" + 
			"GROUP BY\n" + 
			"    \"Month\", \"Gender\", date_trunc('Month', a.ordered_date)\n" + 
			"ORDER BY\n" + 
			"    date_trunc('Month', a.ordered_date)", nativeQuery=true)
	List<MonthlyGenderSales> currentYearGenderSales();
}
