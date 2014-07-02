#app.factory 'LoginFactory', (Restangular) ->
#  _users = Restangular.all(dbServer + 'users')

app.controller 'LoginController', ['$scope', 'Restangular', ($scope, Restangular) ->
#  $scope.users = LoginFactory._users
  $scope.users = Restangular.all(dbServer + 'users')
  console.log($scope.users)
]

