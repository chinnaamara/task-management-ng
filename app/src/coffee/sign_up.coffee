app.controller 'SignUpController', ($scope, DashboardFactory, $window) ->
  console.log 'SignUpController..'
  $scope.data = [{}]
  $scope.signIn = ->
    console.log 'signIn..'