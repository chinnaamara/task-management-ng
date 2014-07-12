app.factory 'LoginFactory', (Restangular) ->
<<<<<<< HEAD
  _users = Restangular.all(dbServer + 'users')

app.controller 'LoginController', ($scope, LoginFactory) ->
#  $scope.users = LoginFactory._users
  $scope.users = LoginFactory.all(dbServer + 'users')
  console.log($scope.users)
=======
  retrieveUser = ->
    Restangular.all('users').getList().then (result) ->
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
>>>>>>> e143de0fc58f0c287949ccf44faa2793d9807259
