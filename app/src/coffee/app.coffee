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
        'viewB': {controller: '', templateUrl: 'home.html'}
      }
    })
  return
)