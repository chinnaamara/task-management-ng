serviceUrl = '/localhost:3000/'
app = angular.module('TaskManager', ['ui.router', 'restangular'])
app.config(($stateProvider) ->
  $stateProvider
    .state('login', {
      url: '',
      views: {
        'viewA': {templateUrl: 'login_header.html'}
        'viewB': {controller: 'LoginController', templateUrl: 'login.html'}
      }
    })
    .state('dashboard', {
      url: '/tasks'
      views: {
        'viewA': {templateUrl: 'header.html'}
        'viewB': {controller: 'TasksController', templateUrl: 'home.html'}
      }
    })
    .state('newTask', {
        url: '/tasks/new'
        views: {
          'viewA': {templateUrl: 'header.html'}
          'viewB': {controller: 'CreateNewController', templateUrl: 'new_task.html'}
        }
      })
    .state('editTask', {
      url: '/tasks/:id/edit'
      views: {
        'viewA': {templateUrl: 'header.html'}
        'viewB': {controller: 'EditTaskController', templateUrl: 'edit_task.html'}
      }
    })
  return
)

