var app = angular.module("gravtyApp", []);
/*
* @see https://stackoverflow.com/questions/19671962/uncaught-error-injectorunpr-with-angular-after-deployment
*/
app.controller("todoCtrl", ["$http", function($http) {
  var todo = this;
  var url = '/todo/api';
  todo.todoList = [];
  todo.taskAdd = null;

  this.$onInit = function(){
    todo.getAllTodo();
  }

  todo.onTaskAddBtnClicked = function(id){
    todo.taskAdd = id;
  }

  todo.onTaskInputBlur = function(){
    todo.taskAdd = null;
  }

  todo.getAllTodo = function(){
    $http.get(`${url}/all`).then(function(res){
      todo.todoList = res.data;
      //console.log(todo.todoList);
    });
  };

  todo.addTodo = function(){
    var sortOrder = todo.todoList.length > 0 ? todo.todoList[todo.todoList.length - 1].sortOrder + 1 : 1; //new item sort order will be 1 more than current last item
    $http.post(`${url}/main/post`, {title: todo.mainTitle, sortOrder}).then(function(res){
      todo.todoList.push(res.data);
      $('#newTask').modal('toggle');
      todo.mainTitle = '';
    });
  };

  todo.subTaskSubmit = function(todoId){
    $http.post(`${url}/sub-task/post/${todoId}`, {body: todo.newTask}).then(function(res){
      var data = res.data;
      var subTask = {id: data.id, body: data.body, status: data.status, todo: data.todo.id};

      var newList = todo.todoList.filter(function(task){
        if(task.id === todoId){
          task.todos.push(subTask);
        }
        return task;
      });
      todo.newTask = '';
    });
  }

  todo.deleteTask = function(id){
    if(confirm("Delete this task?")){
      $http.delete(`${url}/main/delete/${id}`).then(function(res){
        todo.todoList = res.data;
      });
    };
  }

  todo.deleteSubTask = function(id){
    $http.delete(`${url}/sub-task/delete/${id}`).then(function(res){
      todo.todoList = res.data;
    });
  }

  todo.checkTask = function(subTask){
    $http.post(`${url}/sub-task/check/${subTask.id}`);
  }

  $(".sortableSub").sortable({
    axis: 'y',
    update: function (event, ui) {
      var data = $(this).sortable('serialize', { key: "sort" } );
      $.ajax({
          data: data,
          type: 'POST',
          url: `${url}/main/reorder`
        });
    }
  });

}])
