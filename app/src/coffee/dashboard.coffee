#app.factory 'DashboardFactory', (Restangular) ->
#  retrieveTasks = ->
#    Restangular.all('tasks').getList().then (result) ->
#      tasks = result
#      return tasks
#
#  return {
#    tasks: retrieveTasks
#  }

app.factory 'DashboardFactory', ->
  projects = _.map _.range(10), (id) ->
    id: id + 1
    summary: Faker.Lorem.words(4).join ' '
    key: Faker.Lorem.words(1).join ''
    dueDate: Faker.Date.future(0)
    description: Faker.Lorem.sentences()
    lead: Faker.Name.firstName()
    url: Faker.Internet.domainName()
    createdDate: new Date()
    tasks: _.map _.range(15), (id) ->
      id: id + 1
      summary: Faker.Lorem.words(3).join ' '
      dueDate: Faker.Date.future(0)
      description: Faker.Lorem.sentences()
      status: Faker.Lorem.words(1).join ''
      createDate: new Date()
      assighnedTo: Faker.Name.firstName()
      priority: Faker.Lorem.words(1).join ''

  newProject = (p) ->
    projects.push p
    return true
  return {
    projects: projects
    add: newProject
  }


app.controller 'DashboardController', ($scope, DashboardFactory, ngTableParams, $window) ->
  $scope.projects = DashboardFactory.projects
  console.log $scope.projects
  $scope.tasksPerPage = 8
  $scope.showMoreFlag = 0
  $scope.activeProject = {}
  $scope.predicate = '-id'
#  DashboardFactory.tasks().then (data) ->
#    $scope.tasks = data
  $scope.viewTasks = (project) ->
    $scope.showMoreFlag = 1
    $scope.activeProject = project
    $scope.projectTitle = project.summary
    $scope.allTasks = project.tasks.slice(0, $scope.tasksPerPage)
    $scope.error = true;

  $scope.viewAllTasks = () ->
    $scope.showMoreFlag = 0
    $scope.projectTitle = 'All Projects Tasks'
    $scope.error = false;
    data = []
    _.forEach($scope.projects, (p) ->
      data = data.concat p.tasks
    )
    $scope.allTasks = data.slice(0, $scope.tasksPerPage)

  $scope.viewAllTasks()
  console.log $scope.allTasks

  $scope.showMore = ->
    $scope.tasksPerPage += 4
    if $scope.showMoreFlag == 0
      $scope.viewAllTasks($scope.tasksPerPage)
    else
      $scope.viewTasks($scope.activeProject, $scope.tasksPerPage)

  $scope.showAll = ->
    $scope.tasksPerPage = 8
    $scope.viewAllTasks()

  $scope.showSome = (project) ->
    $scope.tasksPerPage = 8
    $scope.viewTasks(project)
