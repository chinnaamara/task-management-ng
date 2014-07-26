app.factory 'SignUpFactory',['$firebase', 'BASEURI', ($firebase, BASEURI) ->
  usersRef = new Firebase BASEURI + 'users'

#  retrieveUsers = ->
  data = {}
  usersRef.on('value', (res) ->
    data = res.val()
#    console.log data
#    return data
  , (err) ->
    data = err.code
  )
#  return data

  addUser = (data) ->
    console.log 'user creating...'
    addUserRef = new Firebase BASEURI + 'users/' + data.username
    addUserRef.child('username').set data.username
    addUserRef.child('email').set data.email
    addUserRef.child('password').set data.password
    console.log 'user creatd'
    return 'true'

  return {
  getUsers: data
  signUp: addUser
  }
]

app.controller 'SignUpController', ($scope, SignUpFactory, $window) ->
#  $scope.users = $scope.$watch(SignUpFactory.getUsers(), (res) ->
#    return res
#  )
  $scope.users = SignUpFactory.getUsers
  console.log $scope.users
  $scope.signUp = ->
    $scope.$watch(SignUpFactory.signUp($scope), (res) ->
      if res
        console.log "success..."
    )
