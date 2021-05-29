package com.manager.app.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.manager.app.models.Customer;
import com.manager.app.models.projection.GenericGenderCount;

public interface CustomerRepository extends CrudRepository<Customer, Integer>, PagingAndSortingRepository<Customer, Integer>{

	Page<Customer> findByContactNumber(Pageable pageable, String contact_no);

	List<Customer> findByReferrerId(int id);

	List<Customer> findByReferralPendingTrueOrderByJoinedDateDesc();

	int countByReferralPendingTrue();

	Customer findByContactNumber(String contactNumber);

	long countByReferrerId(int id);

	@Query(value="SELECT COUNT(id) as myCount, gender as \"Gender\"  FROM customers GROUP BY gender ORDER BY myCount DESC;", nativeQuery=true)
	List<GenericGenderCount> getGenderCount();
}
