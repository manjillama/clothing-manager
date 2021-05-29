package com.manager.app.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manager.app.models.Todo;
import com.manager.app.models.TodoList;
import com.manager.app.repository.TodoListRepository;
import com.manager.app.repository.TodoRepository;

@Controller
@RequestMapping("/todo")
public class TodoController {
	@Autowired
	TodoRepository todoRepo;
	@Autowired
	TodoListRepository todoListRepo;
	
	@GetMapping()
	public String viewTodo() {
		return "todo";
	}
	
	@GetMapping("/api/all")
	@ResponseBody
	public List<Todo> getAll(){
		return todoRepo.findAllByOrderBySortOrderAsc();
	}
	
	@PostMapping("/api/main/post")
	@ResponseBody
	public Todo postMainTodo(@RequestBody Todo todo) {
		todoRepo.save(todo);
		todo.setTodos(new ArrayList<TodoList>());
		return todo;	
	}
	
	@DeleteMapping("/api/main/delete/{id}")
	@ResponseBody
	public List<Todo> deleteMainTodo(@PathVariable int id) {
		todoRepo.delete(id);
		return (List<Todo>) todoRepo.findAll();
	}
	
	@PostMapping("/api/sub-task/post/{orderId}")
	@ResponseBody
	public TodoList postSubTodo(@RequestBody TodoList subTodo, @PathVariable int orderId) {
		subTodo.setTodo(todoRepo.findOne(orderId));
		todoListRepo.save(subTodo);
		return subTodo;
	}
	
	@PostMapping("/api/sub-task/check/{id}")
	@ResponseBody
	public void checkSubTodo(@PathVariable int id) {
		TodoList subTodo = todoListRepo.findOne(id);
		subTodo.setStatus(!subTodo.isStatus());
		todoListRepo.save(subTodo);
	}
	
	@DeleteMapping("/api/sub-task/delete/{id}")
	@ResponseBody
	public List<Todo> deleteSubTodo(@PathVariable int id) {
		todoListRepo.delete(id);
		return (List<Todo>) todoRepo.findAll();
	}
	
	@PostMapping("/api/main/reorder")
	@ResponseBody
	public String postTodo(@RequestParam int sort[]) {
		for(int i = 0; i < sort.length; i++) {
			Todo todo = todoRepo.findOne(sort[i]);
			todo.setSortOrder(i+1); //Since index starts from zero
//			System.out.format("%s %d",todo.getTitle(), i+1);System.out.println();
			todoRepo.save(todo);
		}
		return "success";
	}
}
