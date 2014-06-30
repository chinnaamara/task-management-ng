(angular.module 'taskmanagement',['ui-router','ui.bootstrap'])
.config ($stateProvider, $urlRouterProvider)->
  $urlRouterProvider.otherwise '/'

  $stateProvider.state('/main',{url:'/main',templateUrl:'home', controller:'homeCtrl'})
#  .state('/create',{url:'/create',templateUrl:'create',controller:'createCtrl'})