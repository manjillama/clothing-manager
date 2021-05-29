<%@ include file="includes/header.jsp" %>
<script
  src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"
  integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E="
  crossorigin="anonymous"></script>

<script>
  $(function() {

	  $(".sortableSub").sortable({
		    axis: 'y',
		    update: function (event, ui) {
		      var data = $(this).sortable('serialize', { key: "sort" } );
		      console.log(data)
		    }
		  });

  });
 </script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" ng-controller="todoCtrl as todo" style="padding-bottom: 30px;" ng-cloak>
	<div class="container-fluid">
		<h3 style="max-width: 800px;margin-left: auto;margin-right: auto;margin-bottom: 20px;">To-Do <button class="pull-right btn-chromeless" data-toggle="modal" data-target="#newTask"><i class="fa fa-plus" aria-hidden="true"></i></button></h3>
		<div class="col-md-12">

			<div id="todo">
				<h5 class="text-center" ng-if="todo.todoList.length < 1">YIPPY! NO TASK FOR NOW, TIME TO RELAX... &#128526;</h5>
				<ul class="list-unstyled sortableSub">
				  
				  <li id="item_{{task.id}}" ng-repeat="task in todo.todoList" ng-init="todo.subListLoaded()">
				  	<h3>{{task.title}}
				  		<div class="pull-right" ng-if="todo.taskAdd == null">
				  			<button class="btn-chromeless text-muted" ng-click="todo.deleteTask(task.id)"><small><i class="fa fa-trash" aria-hidden="true"></i></small></button>
				  			&nbsp;
	  						<button class="btn-chromeless" ng-click="todo.onTaskAddBtnClicked(task.id)">+</button>
						</div>
				  	</h3>

				  	<div ng-if="todo.taskAdd == task.id">
			  			<form ng-submit="todo.subTaskSubmit(task.id)" style="display:flex; margin: 15px;">
			  				<input ng-model="todo.newTask"
				  			ng-blur="todo.onTaskInputBlur()"
				  			placeholder="New Task" class="form-control" required/>
		  				</form>
				  	</div>

				  	<ul class="list-unstyled sub-todo">
				  		<li ng-repeat="subTask in task.todos">
				  			
				  			<div class="inputGroup">
						    	<input id="option{{subTask.id}}" ng-model="subTask.status" ng-change="todo.checkTask(subTask)" type="checkbox"/>
						    	<label for="option{{subTask.id}}">{{subTask.body}}</label>
						    	<button ng-click="todo.deleteSubTask(subTask.id)" style="outline:none;height:21px;width:21px;outline: none;height: 21px;width: 21px;position: absolute;right: 0;top: 8px; z-index: 1000" class="pull-right img-circle btn-chromeless btn-danger">
					  				<small>x</small>
					  			</button>
						  	</div>				  			
				  		</li> 
				  	</ul>
				  	<hr/>
				  </li>
				</ul>
			</div>

	   </div>
	</div>
	<!-- Container fluid -->

	<!-- Modal -->
	<div class="modal fade" id="newTask" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-body">
	        <form ng-submit="todo.addTodo()">
	        	<input class="form-control" ng-model="todo.mainTitle" placeholder="New title for your task" type="text" required/>
		        <div class="text-right" style="margin-top: 15px;">
		        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        <button type="submit" class="btn btn-primary">Add</button>
		        </div>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>

</div>
<!-- Content Wrapper -->
<%@ include file="includes/footer.jsp" %>
