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
    dueDate: Faker.Date.future(0)
    description: Faker.Lorem.sentences()
    lead: Faker.Name.firstName()
    url: Faker.Internet.domainName()
  return {
    projects: projects
  }


app.controller 'DashboardController', ($scope, DashboardFactory, $window) ->
  $scope.projects = DashboardFactory.projects
  console.log $scope.projects
#  DashboardFactory.tasks().then (data) ->
#    $scope.tasks = data
