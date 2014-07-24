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

  retrieveTasksByProjectId = (projectId) ->
    tasksRef = new Firebase BASEURI + 'projects/' + projectId + '/tasks/'
    tasks = $firebase tasksRef
    return tasks

  return {
    retrieveProjects : projects
    addProject : add
    updateProject : update
    removeProject : remove
    addTask: addTask
    getTasksByProjectId : retrieveTasksByProjectId
  }

app.controller 'DashboardController', ($scope, DashboardFactory, ngTableParams, $filter) ->
  $scope.projects = DashboardFactory.retrieveProjects
  $scope.allTasks = {}
  $scope.tasks = {}
  $scope.projectTasks = {}
  $scope.tasksPerPage = 3
  $scope.showMoreFlag = 0
  $scope.activeProject = {}
  $scope.predicate = '-createdDate'

  getTasksTable = (data) ->
    $scope.tasksTable = new ngTableParams({
      page: 1,
      count: 6,
      sorting: {}
    })


  $scope.viewAllTasks = () ->
    $scope.tasksPerPage = 3
    console.log 'viewAllTasks'
    $scope.showMoreFlag = 0
    $scope.projectTitle = 'All Projects Tasks'
    $scope.error = false;
    tasksList = []
    keys = _.keys $scope.projects
    console.log $scope.projects
    console.log keys
    numberdKeys = _.filter(keys, (n) ->
      isNaN(Number n) == false
    )
    _.forEach(numberdKeys, (p) ->
      data1 = DashboardFactory.getTasksByProjectId(p)
      data2 = _.filter(data1, (t) ->
        !_.isFunction t
      )
      data3 = _.filter(data2, (t) ->
        _.isObject t
      )
      tasksList.push data3
    )
    $scope.tasks = _.flatten(tasksList).reverse()
    $scope.allTasks = $scope.tasks.slice(0, $scope.tasksPerPage)
#    getTasksTable($scope.tasks)

  $scope.viewAllTasks()

  $scope.viewProjectTasks = (project) ->
    $scope.tasksPerPage = 3
    $scope.showMoreFlag = 1
    $scope.activeProject = project
    $scope.projectTitle = $scope.activeProject.title
    $scope.error = true;
    data1 = DashboardFactory.getTasksByProjectId project.id
    data2 = _.filter(data1, (t) ->
      !_.isFunction t
    )
    data3 = _.filter(data2, (t) ->
      _.isObject t
    )
    data4 = _.toArray(data3).reverse()
    $scope.projectTasks = data4
    $scope.allTasks = $scope.projectTasks.slice(0, $scope.tasksPerPage)


  $scope.showMore = ->
    $scope.tasksPerPage += 3
    if $scope.showMoreFlag == 0
      $scope.allTasks = $scope.tasks.slice(0, $scope.tasksPerPage)
    else
      $scope.allTasks = $scope.projectTasks.slice(0, $scope.tasksPerPage)

  $scope.showAll = ->
    $scope.tasksPerPage = 8
    $scope.viewAllTasks()

  $scope.showSome = (project) ->
    $scope.tasksPerPage = 3
    $scope.viewProjectTasks(project)
