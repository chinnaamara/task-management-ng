app.factory 'LoginFactory', (Restangular) ->
  _users = Restangular.all(dbServer + 'users')

app.controller 'LoginController', ($scope, LoginFactory) ->
#  $scope.users = LoginFactory._users
  $scope.users = LoginFactory.all(dbServer + 'users')
  console.log($scope.users)