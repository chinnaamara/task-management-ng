app.controller 'NewTaskController', ($scope, DashboardFactory) ->
  data = _.toArray DashboardFactory.data

  $scope.projects = _.filter data, (p) ->
    !_.isFunction p

  $scope.projects = _.filter $scope.projects, (p) ->
    _.isObject p

  $scope.currentProject = {}
  $scope.taskId
  $scope.changeProject = ->
    $scope.currentProject = _.find($scope.projects, (p) ->
      return $scope.projectName == p.title
    )
    console.log $scope.currentProject

    tasks = DashboardFactory.getTasksById $scope.currentProject.id
    keys = _.keys tasks
    numberdKeys = _.filter(keys, (n) ->
      isNaN(Number n) == false
    )
    $scope.taskId = Number(_.last numberdKeys) || 0

  $scope.addTask = ->
    newTask = {
      projectId: $scope.currentProject.id
      taskId: $scope.taskId + 1
      summary: $scope.task.summary
      status: 'Open'
      dueDate: $scope.task.dueDate
      description: $scope.task.description
#      priority: $scope.task.priority
      createdDate: new Date().toString()
    }
    DashboardFactory.addTask newTask
    return
