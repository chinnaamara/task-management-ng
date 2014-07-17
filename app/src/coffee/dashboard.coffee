app.factory 'DashboardFactory', ($firebase, BASEURI) ->
  projectsRef = new Firebase BASEURI + 'projects'
  projects = $firebase projectsRef

  add = (newProject) ->
    addRef = new Firebase BASEURI + 'projects/' + newProject.id
    addRef.child('id').set(newProject.id)
    addRef.child('title').set(newProject.title)
    addRef.child('url').set(newProject.url)
    addRef.child('key').set(newProject.key)
    addRef.child('lead').set(newProject.lead)
    addRef.child('description').set(newProject.description)
    addRef.child('createdDate').set(newProject.createdDate)
    addRef.child('dueDate').set(newProject.dueDate)
    return

  update = (project) ->
    ref.$update(id)
    return

  remove = (id) ->
    projects.$remove(id)
    return

  addTask = (newTask) ->
    addRef = new Firebase BASEURI + 'projects/' + newTask.projectId + '/tasks/' + newTask.taskId
    addRef.child('id').set(newTask.taskId)
    addRef.child('summary').set(newTask.summary)
    addRef.child('description').set(newTask.description)
    addRef.child('createdDate').set(newTask.createdDate)
    addRef.child('dueDate').set(newTask.dueDate)
#    addRef.child('priority').set(newTask.priority)
    addRef.child('status').set(newTask.status)
    return

  return {
    data : projects
    addProject : add
    updateProject : update
    removeProject : remove
    addTask: addTask
  }

app.controller 'DashboardController', ($scope, DashboardFactory) ->
#  data = _.toArray DashboardFactory.data
  $scope.projects = DashboardFactory.data
  $scope.tasksPerPage = 8
  $scope.showMoreFlag = 0
  $scope.activeProject = {}
  $scope.predicate = '-createdDate'
  $scope.viewTasks = (project) ->
    $scope.showMoreFlag = 1
    $scope.activeProject = project
    $scope.projectTitle = project.summary
    $scope.allTasks = project.tasks.slice(0, $scope.tasksPerPage)
    $scope.error = true;

  $scope.viewAllTasks = () ->
    $scope.showMoreFlag = 0
    $scope.projectTitle = 'All Projects Tasks'
    $scope.error = false;
    data = []
    _.forEach($scope.projects, (p) ->
      data = data.concat p.tasks
    )
    $scope.allTasks = data.slice(0, $scope.tasksPerPage)

  $scope.viewAllTasks()
  console.log $scope.allTasks

  $scope.showMore = ->
    $scope.tasksPerPage += 4
    if $scope.showMoreFlag == 0
      $scope.viewAllTasks($scope.tasksPerPage)
    else
      $scope.viewTasks($scope.activeProject, $scope.tasksPerPage)

  $scope.showAll = ->
    $scope.tasksPerPage = 8
    $scope.viewAllTasks()

  $scope.showSome = (project) ->
    $scope.tasksPerPage = 8
    $scope.viewTasks(project)
