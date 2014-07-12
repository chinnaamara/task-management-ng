dbServer = 'http://localhost:3000/'
app = angular.module('TaskManager', ['ui.router', 'restangular'])
app.config(($stateProvider) ->
  $stateProvider
  .state('login', {
      url: '',
      views: {
        'viewA': {templateUrl: 'login_header.html'}
        'viewB': {controller: 'LoginController', templateUrl:'login.html'}
      }
    })
  return
)