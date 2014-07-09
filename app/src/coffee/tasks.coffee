app.factory 'TasksFactory', (Restangular) ->
  retrieveTasks = ->
    Restangular.all('tasks').getList().then (result) ->
      tasks = result
      return tasks

  return {
    tasks: retrieveTasks
  }

app.controller 'TasksController', ($scope, TasksFactory, $window) ->
  TasksFactory.tasks().then (data) ->
    $scope.tasks = data
