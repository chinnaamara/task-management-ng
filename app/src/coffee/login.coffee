#app.factory 'LoginFactory', (Restangular) ->
#  _users = {}
#  Restangular.all(serviceUrl + 'users').getList().then (result) ->
#    _users = result[0]
#    console.log _users
#    return {users: _users}

#app.factory 'LoginFactory', (Restangular) ->
#  @.retrieveUser = ->
#    Restangular.all(serviceUrl + 'users').getList().then (result) ->
#      console.log result[0]
#      return result[0]
#  return
#
#app.controller 'LoginController', ($scope, LoginFactory) ->
#  LoginFactory.retrieveUser().then (data) ->
#    console.log data
#    $scope.users = data

app.controller 'LoginController', ($scope, $window, Restangular) ->
  Restangular.all(serviceUrl + 'users').getList().then (result) ->
    $scope.users = result[0]

  $scope.login = ->
    console.log $scope.users
    console.log $scope.userId
    console.log $scope.password
    $scope.validate($scope)
#    $window.location='#/tasks'

  $scope.validate = (data) ->
    console.log data.userId
    $window.location='#/tasks'