app = angular.module('TaskManager', ['ui.router', 'restangular', 'ngTable'])
app.config(($stateProvider, RestangularProvider) ->
  RestangularProvider.setBaseUrl 'http://localhost:3000/'
  $stateProvider
    .state('login', {
      url: '',
      views: {
        'viewA@': {templateUrl: 'login_nav.html'}
        'viewB@': {templateUrl: 'login.html', controller: 'LoginController'}
      }
    })
    .state('tasks', {
      url: '/dashboard'
      views: {
        'viewA@': {templateUrl: 'nav.html'}
        'viewB@': {templateUrl: 'dashboard.html', controller: 'DashboardController'}
      }
    })
    .state('tasks.new', {
        url: '/new'
        views: {
          'viewA@': {templateUrl: 'nav.html'}
          'viewB@': {templateUrl: 'new_task.html', controller: 'NewTaskController'}
        }
      })
    .state('tasks.edit', {
      url: '/edit/{id}'
      views: {
        'viewA@': {templateUrl: 'nav.html'}
        'viewB@': {templateUrl: 'edit_task.html', controller: 'EditTaskController'}
      }
    })
    .state('newProject', {
      url: '/project/new'
      views: {
        'viewA@': {templateUrl: 'nav.html'}
        'viewB@': {templateUrl: 'new_project.html', controller: 'NewProjectController'}
      }
    })
  return
)
