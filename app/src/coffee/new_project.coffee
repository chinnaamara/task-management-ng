app.controller 'NewProjectController', ($scope, DashboardFactory) ->
  console.log 'new project'
  $scope.createProject = ->
#    Projects.add $scope
    newProject = {
      summary: $scope.project.title
      key: $scope.project.key
      dueDate: $scope.project.date
      description: $scope.project.description
      lead: $scope.project.lead
      url: $scope.project.url
      createdDate: new Date()
      tasks: []
    }
    DashboardFactory.add newProject
#    DashboardFactory.add(newProject).then (result) ->
#      console.log result
    console.log 'addded'
#    return
  return