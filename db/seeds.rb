# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


root = Task.create(name: 'root', description: 'desc')

task = Task.new(name: 'task1', description: 'desc')
task.parent = root
task.save

task = Task.new(name: 'task2', description: 'desc')
task.parent = root
task.save

root = task
task = Task.new(name: 'task3', description: 'desc')
task.parent = root
task.save

task = Task.new(name: 'task4', description: 'desc')
task.parent = root
task.save

task = Task.new(name: 'task5', description: 'desc')
task.parent = root
task.save

root = task
task = Task.new(name: 'task6', description: 'desc')
task.parent = root
task.save

root = task
task = Task.new(name: 'task7', description: 'desc')
task.parent = root
task.save

task = Task.new(name: 'task8', description: 'desc')
task.parent = root
task.save