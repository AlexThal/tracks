# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning db"
ExerciseSet.destroy_all
Block.destroy_all
Session.destroy_all
User.destroy_all
Category.destroy_all
Sport.destroy_all

# Users

puts "Creating users"

users = [
  { username: "Alex", email: "alex@example.com", password: "123456" },
  { username: "Amanda", email: "amanda@example.com", password: "123456" },
  { username: "Rodrigo", email: "rodrigo@example.com", password: "123456" }
]

users.each do |user|
  user = User.create!(user)
  puts "Created user #{user.username}"
end

alex = User.find_by username: 'Alex'
amanda = User.find_by username: 'Amanda'
rodrigo = User.find_by username: 'Rodrigo'

puts "Creating sports"

sports = [
  { name: "Running" },
  { name: "Gym" },
  { name: "Climbing" },
  { name: "Yoga" },
  { name: "Swimming" }
]

sports.each do |sport|
  sport = Sport.create!(sport)
  puts "Created sport #{sport.name}"
end

running = Sport.find_by name: 'Running'
gym = Sport.find_by name: 'Gym'
climbing = Sport.find_by name: 'Climbing'
yoga = Sport.find_by name: 'Yoga'
swimming = Sport.find_by name: 'Swimming'

puts "Creating categories"

categories = [
  { name: "Cardio" },
  { name: "Mobility" },
  { name: "Strength" },
  { name: "Flexibility" },
]

categories.each do |category|
  category = Category.create!(category)
  puts "Created category #{category.name}"
end

cardio = Category.find_by name: 'Cardio'
mobility = Category.find_by name: 'Mobility'
strength = Category.find_by name: 'Strength'

puts "Creating sessions"

sessions = [
  # Alex
  { user: alex, title: "Evening run", sport: running, date: Date.new(2023, 6, 3), comment: "Training for the half marathon! 💪", favourite: false, private: false, photo: "https://images.pexels.com/photos/3763869/pexels-photo-3763869.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" },
  { user: alex, title: "Killer swim", sport: swimming, date: Date.new(2023, 6, 5), comment: "Might have pushed it too hard on this one...", favourite: false, private: true, photo: "https://images.pexels.com/photos/863988/pexels-photo-863988.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" },
  { user: alex, title: "Morning swim", sport: swimming, date: Date.new(2023, 6, 7), comment: "This one really hit the sweet spot!", favourite: true, private: false, photo: "https://images.pexels.com/photos/1263348/pexels-photo-1263348.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" },
  # Amanda
  { user: amanda, title: "Gym workout", sport: gym, date: Date.new(2023, 6, 4), comment: "New PR on the deadlift 💪", favourite: true, private: false, photo: "https://images.pexels.com/photos/11266952/pexels-photo-11266952.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" },
  { user: amanda, title: "Yoga to unwind", sport: yoga, date: Date.new(2023, 6, 5), comment: "Need to recover after that heavy lifting day", favourite: false, private: true },
  { user: amanda, title: "Gym mobility", sport: gym, date: Date.new(2023, 6, 10), comment: "In this session I focused heavily on mobility", favourite: true, private: false, photo: "https://images.pexels.com/photos/3621954/pexels-photo-3621954.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" },
  # Rodrigo
  { user: rodrigo, title: "Boulder sesh", sport: climbing, date: Date.new(2023, 6, 4), comment: "Good to be out on a sunny day", favourite: true, private: false },
  { user: rodrigo, title: "Back to the gym", sport: gym, date: Date.new(2023, 6, 5), comment: "First day back after a long break", favourite: false, private: true },
  { user: rodrigo, title: "5k run", sport: running, date: Date.new(2023, 6, 9), comment: "Training for that sub 20min 5k", favourite: true, private: false, photo: "https://images.pexels.com/photos/3764011/pexels-photo-3764011.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" }
]

sessions.each do |session|
  session = Session.create!(session)
  puts "Created #{session.title}"
end

puts "Creating blocks"

blocks = [
  # Alex's Long Evening Run
  { session: Session.all[0], category: cardio, name: "Zone 2 Running", custom_field: '"terrain":"gravel"' },
  { session: Session.all[0], category: mobility, name: "Stretching" },
  # Alex's Killer Swim Sesh
  { session: Session.all[1], category: cardio, name: "Backstroke" },
  { session: Session.all[1], category: cardio, name: "Butterfly Stroke" },
  { session: Session.all[1], category: cardio, name: "Freestyle" },
  { session: Session.all[1], category: cardio, name: "Cooldown" },
  # Alex's Morning Swim
  { session: Session.all[2], category: cardio, name: "Freestyle" },
  { session: Session.all[2], category: cardio, name: "Backstroke" },

  # Amanda's Strong Gym Workout
  { session: Session.all[3], category: strength, name: "Heavy Deadlifts", gear: "Lifting belt" },
  { session: Session.all[3], category: strength, name: "Squats", gear: "Lifting belt" },
  { session: Session.all[3], category: strength, name: "Bench Press", gear: "Wrist wraps" },
  # Amanda's Yoga Session
  { session: Session.all[4], category: mobility, name: "Sun salutations" },
  { session: Session.all[4], category: mobility, name: "Hip openers" },
  { session: Session.all[4], category: mobility, name: "Heart-opening asanas" },
  # Amanda's Mobility at the Gym
  { session: Session.all[5], category: mobility, name: "Kettlebell Flow" },
  { session: Session.all[5], category: mobility, name: "Single Leg Kettlebel Deadlift" },
  { session: Session.all[5], category: strength, name: "Cossack Squats" },
  { session: Session.all[5], category: cardio, name: "Rowing Machine", custom_field: '"duration":"45min"' },

  # Rodrigo's Outdoor Bolder Sesh
  { session: Session.all[6], name: "Limit Bouldering", custom_field: '"duration":"20min"' },
  { session: Session.all[6], name: "Overhangs", custom_field: '"duration":"30min"'},
  { session: Session.all[6], name: "Slabs", custom_field: '"duration":"30min"' },
  { session: Session.all[6], category: mobility, name: "Stretching" },
  # Rodrigo's Back to the Gym Sesh
  { session: Session.all[7], category: mobility, name: "Kettlebell Warmup" },
  { session: Session.all[7], category: strength, name: "Barbell Squats" },
  { session: Session.all[7], category: strength, name: "Pullups" },
  { session: Session.all[7], category: cardio, name: "Sprints" },
  # Rodrigo's 5k Run
  { session: Session.all[8], category: cardio, name: "Fast Running", custom_field: '"duration":"20min"' },
  { session: Session.all[8], category: cardio, name: "Cooldown", custom_field: '"duration":"5min"' }
]

blocks.each do |block|
  block = Block.create!(block)
  puts "Created #{block.name}"
end

puts "Creating Exercise Sets"

exercise_sets = [
  # Alex's Long Evening Run
  # 0 Zone 2 Running
  { block: Block.all[0], distance: "8.5km", custom_field: '"duration":"45min"' },
  # 1 Stretching
  { block: Block.all[1], custom_field: '"Forward Fold":"5 breaths", "Butterfly":"5 breaths", "Down-dog":"5 breaths"' },
  { block: Block.all[1], custom_field: '"Forward Fold":"5 breaths", "Butterfly":"5 breaths", "Down-dog":"5 breaths"' },
  { block: Block.all[1], custom_field: '"Forward Fold":"10 breaths", "Pigeon Pose":"10 breaths"' },
  # Alex's Killer Swim
  # 2 Backstroke
  { block: Block.all[2], distance: "100m" },
  { block: Block.all[2], distance: "100m" },
  { block: Block.all[2], distance: "100m" },
  # 3 Butterfly Stroke
  { block: Block.all[3], distance: "100m" },
  { block: Block.all[3], distance: "100m" },
  { block: Block.all[3], distance: "100m" },
  # 4 Freestyle
  { block: Block.all[4], distance: "200m" },
  { block: Block.all[4], distance: "100m" },
  { block: Block.all[4], distance: "50m" },
  # 5 Cooldown
  { block: Block.all[5], distance: "250m" },
  # Alex's Morning Swim
  # 6 Freestyle
  { block: Block.all[6], distance: "100m" },
  { block: Block.all[6], distance: "100m" },
  { block: Block.all[6], distance: "100m" },
  { block: Block.all[6], distance: "100m" },
  # 7 Backstroke
  { block: Block.all[7], distance: "100m" },
  { block: Block.all[7], distance: "100m" },
  { block: Block.all[7], distance: "100m" },

  # Amanda's Strong Gym Workout
  # 8 Heavy Deadlifts
  { block: Block.all[8], repetitions: "5", weight: "100" },
  { block: Block.all[8], repetitions: "5", weight: "120" },
  { block: Block.all[8], repetitions: "5", weight: "120" },
  { block: Block.all[8], repetitions: "5", weight: "125" },
  { block: Block.all[8], repetitions: "5", weight: "100" },
  # 9 Squats
  { block: Block.all[9], repetitions: "12", weight: "80" },
  { block: Block.all[9], repetitions: "10", weight: "90" },
  { block: Block.all[9], repetitions: "10", weight: "90" },
  # 10 Bench Press
  { block: Block.all[10], repetitions: "12", weight: "50" },
  { block: Block.all[10], repetitions: "10", weight: "60" },
  { block: Block.all[10], repetitions: "10", weight: "60" },
  # Amanda's Yoga Session
  # 11 Sun Salutations
  { block: Block.all[11], custom_field: '"duration":"5 breaths"' },
  { block: Block.all[11], custom_field: '"duration":"5 breaths"' },
  { block: Block.all[11], custom_field: '"duration":"5 breaths"' },
  # 12 Hip Openers
  { block: Block.all[12] },
  # 13 Heart Opening
  { block: Block.all[13] },
  # Amanda's Mobility at the Gym
  # 14 Kettlebell Flow
  # 15 Single Leg Kettlebel Deadlift
  { block: Block.all[15], repetitions: "12", weight: "20" },
  { block: Block.all[15], repetitions: "10", weight: "20" },
  { block: Block.all[15], repetitions: "8", weight: "20" },
  # 16 Cossack Squat
  { block: Block.all[16], repetitions: "12", weight: "16" },
  { block: Block.all[16], repetitions: "10", weight: "16" },
  { block: Block.all[16], repetitions: "8", weight: "16" },
  # 17 Rowing Machine

  # Rodrigo's Outdoor Boulder Sesh
  # 18 Limit Bouldering
  # 19 Overhangs
  # 20 Slabs
  # 21 Stretching
  { block: Block.all[21], custom_field: '"Forward Fold":"5 breaths", "Butterfly":"5 breaths", "Down-dog":"5 breaths"' },
  { block: Block.all[21], custom_field: '"Forward Fold":"5 breaths", "Butterfly":"5 breaths", "Down-dog":"5 breaths"' },
  { block: Block.all[21], custom_field: '"Forward Fold":"10 breaths", "Pigeon Pose":"10 breaths"' },
  # Rodrigo's Back to the Gym Sesh
  # 22 Kettlebell Warmup
  # 23 Barbell Squats
  { block: Block.all[23], repetitions: "12", weight: "80" },
  { block: Block.all[23], repetitions: "10", weight: "90" },
  { block: Block.all[23], repetitions: "10", weight: "80" },
  # 24 Pullups
  { block: Block.all[24], repetitions: "10" },
  { block: Block.all[24], repetitions: "10" },
  { block: Block.all[24], repetitions: "10" },
  # 25 Sprints
  { block: Block.all[25], distance: "400m" },
  { block: Block.all[25], distance: "400m" },
  { block: Block.all[25], distance: "400m" },
  { block: Block.all[25], distance: "400m" },
  # Rodrigo's 5k Run
  # 26 Fast Running
  # 27 Cooldown
]

exercise_sets.each do |set|
  set = ExerciseSet.create!(set)
  puts "Created set ##{set.id}"
end

puts "Finished!"
