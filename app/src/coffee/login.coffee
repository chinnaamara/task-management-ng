app.factory 'LoginFactory', (Restangular) ->
  retrieveUser = ->
    Restangular.all(serviceUrl + 'users').getList().then (result) ->
      _users = result[0]
      return _users

  return {
    users: retrieveUser
  }

app.controller 'LoginController', ($scope, $window, Restangular, LoginFactory) ->
  LoginFactory.users().then (data) ->
    $scope.data = data
    console.log $scope.data
  $scope.user = {}

  $scope.login = ->
    if $scope.user.username == $scope.data.userId
      if $scope.user.password == $scope.data.password
        $window.location='#/tasks'
      else
        showErrorMessage()
    else
      showErrorMessage()
    return

  showErrorMessage = ->
    $scope.error=true;
    $('#password').val('')
    $('#password').focus()
    return
