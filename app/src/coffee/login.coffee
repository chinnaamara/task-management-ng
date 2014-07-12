app.factory 'LoginFactory', (Restangular) ->
  retrieveUser = ->
    Restangular.all('users').getList().then (result) ->
      _users = result[0]
      return _users

  return {
    users: retrieveUser
  }

app.controller 'LoginController', ($scope, $window, LoginFactory) ->
  LoginFactory.users().then (data) ->
    $scope.data = data
    console.log $scope.data
  $scope.user = {}

  $scope.login = ->
    console.log 'LoginController'
    console.log $scope.user.username
    console.log $scope.user.password
    if $scope.user.username == $scope.data.userId
      if $scope.user.password == $scope.data.password
        $window.location = '#/dashboard'
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