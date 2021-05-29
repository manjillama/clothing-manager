package com.manager.app.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.manager.app.models.Todo;

public interface TodoRepository extends CrudRepository<Todo, Integer>{
	List<Todo> findAllByOrderBySortOrderAsc();
}
