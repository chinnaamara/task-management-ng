app.factory 'EditTaskFactory', (Restangular) ->
  retrieveTask = (id) ->
    Restangular.one('tasks', id).get().then (result) ->
      task = result
      return task

  return {
    taskById: retrieveTask
  }

app.controller 'EditTaskController', ($scope, EditTaskFactory, $window, $stateParams) ->
  EditTaskFactory.taskById($stateParams.id).then (data) ->
    $scope.task = data
    console.log $scope.task
  return
