#app.factory 'TasksFactory', (Restangular) ->
#  retrieveTasks = ->
#    Restangular.all('tasks').getList().then (result) ->
#      tasks = result
#      return tasks
#
#  return {
#    tasks: retrieveTasks
#  }

app.factory 'TasksFactory', ->
  tasks = _.map _.range(10), (id) ->
    id: id + 1
    summary: Faker.Lorem.words(4).join ' '
    priority: Faker.Lorem.words(1).join ''
    dueDate: Faker.Date.future(0)
    description: Faker.Lorem.sentences()
    status: Faker.Lorem.words(1).join ''

  return {
    tasks: tasks
  }


app.controller 'TasksController', ($scope, TasksFactory, $window) ->
  $scope.tasks = TasksFactory.tasks
  console.log $scope.tasks
#  TasksFactory.tasks().then (data) ->
#    $scope.tasks = data
