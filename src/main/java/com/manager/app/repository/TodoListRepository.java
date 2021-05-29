package com.manager.app.repository;

import org.springframework.data.repository.CrudRepository;

import com.manager.app.models.TodoList;

public interface TodoListRepository extends CrudRepository<TodoList, Integer>{

}
