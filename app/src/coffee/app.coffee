app = angular.module('TaskManager', ['ui.router', 'restangular'])
app.config(($stateProvider, RestangularProvider) ->
  RestangularProvider.setBaseUrl 'http://localhost:3000/'
  $stateProvider
    .state('login', {
      url: '',
      views: {
        'viewA@': {templateUrl: 'login_header.html'}
        'viewB@': {templateUrl: 'login.html', controller: 'LoginController'}
      }
    })
    .state('tasks', {
      url: '/tasks'
      views: {
        'viewA@': {templateUrl: 'header.html'}
        'viewB@': {templateUrl: 'tasks.html', controller: 'TasksController'}
      }
    })
    .state('tasks.new', {
        url: '/new'
        views: {
          'viewA@': {templateUrl: 'header.html'}
          'viewB@': {templateUrl: 'new_task.html', controller: 'NewTaskController'}
        }
      })
    .state('tasks.edit', {
      url: '/edit/{id}'
      views: {
        'viewA@': {templateUrl: 'header.html'}
        'viewB@': {templateUrl: 'edit_task.html', controller: 'EditTaskController'}
      }
    })
  return
)

