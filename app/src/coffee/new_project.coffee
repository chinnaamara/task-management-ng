app.controller 'NewProjectController', ($scope, DashboardFactory, $window) ->
  projects = DashboardFactory.retrieveProjects
  keys = _.keys projects
  numberdKeys = _.filter(keys, (n) ->
    isNaN(Number n) == false
  )
  id = Number(_.last numberdKeys) || 0

  $scope.createProject = ->
    newProject = {
      id: id + 1
      title: $scope.project.title
      key: $scope.project.key
      dueDate: $scope.project.date
      description: $scope.project.description
      lead: $scope.project.lead
      url: $scope.project.url
      createdDate: new Date().toString()
    }
    DashboardFactory.addProject newProject
    $window.location = '#/dashboard'
    return
  return
