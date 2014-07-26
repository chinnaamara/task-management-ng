app = angular.module('TaskManager', ['ui.router', 'restangular', 'ngTable', 'firebase'])
app.constant('BASEURI', 'https://taskmanagement.firebaseio.com/')
app.config(($stateProvider, RestangularProvider) ->
  RestangularProvider.setBaseUrl 'http://localhost:3000/'
  $stateProvider
    .state('start', {
      url: ''
      views: {
        'viewA@': {templateUrl: 'html/login_nav.html'}
        'viewB@': {templateUrl: 'html/sign_up.html', controller: 'SignUpController'}
      }
    })
    .state('signUp', {
      url: '/join'
      views: {
        'viewA@': {templateUrl: 'html/login_nav.html'}
        'viewB@': {templateUrl: 'html/sign_up.html', controller: 'SignUpController'}
      }
    })
    .state('signIn', {
      url: '/signin'
      views: {
        'viewA@': {templateUrl: 'html/login_nav.html'}
        'viewB@': {templateUrl: 'html/login.html', controller: 'LoginController'}
      }
    })
    .state('tasks', {
      url: '/dashboard'
      views: {
        'viewA@': {templateUrl: 'html/nav.html'}
        'viewB@': {templateUrl: 'html/dashboard.html', controller: 'DashboardController'}
      }
    })
    .state('tasks.new', {
        url: '/new'
        views: {
          'viewA@': {templateUrl: 'html/nav.html'}
          'viewB@': {templateUrl: 'html/new_task.html', controller: 'NewTaskController'}
        }
      })
    .state('tasks.edit', {
      url: '/edit/{id}'
      views: {
        'viewA@': {templateUrl: 'html/nav.html'}
        'viewB@': {templateUrl: 'html/edit_task.html', controller: 'EditTaskController'}
      }
    })
    .state('newProject', {
      url: '/project/new'
      views: {
        'viewA@': {templateUrl: 'html/nav.html'}
        'viewB@': {templateUrl: 'html/new_project.html', controller: 'NewProjectController'}
      }
    })
  return
)

