#TaskBreakDown
#  support users
#    create model
#    configure routes
#    implement login
#      integrate omniauth middleware
#    implement sharing
#      support ability to share subtrees
#      support ability to view shared subtrees


root = Task.create(name: 'TaskBreakDown', description: 'Finish task break down')

user = Task.new(name: 'support users', description: '')
user.parent = root
user.save

root = user

task = Task.new(name: 'create model', description: '')
task.parent = root
task.save

task = Task.new(name: 'configure routes', description: '')
task.parent = root
task.save

task = Task.new(name: 'implement login', description: '')
task.parent = root
task.save

root = task

task = Task.new(name: 'integrate omniauth middleware', description: '')
task.parent = root
task.save

root = user

task = Task.new(name: 'implement sharing', description: '')
task.parent = root
task.save

root = task

task = Task.new(name: 'implement subtree sharing', description: '')
task.parent = root
task.save

task = Task.new(name: 'implement shared subtree view', description: '')
task.parent = root
task.save