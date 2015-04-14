require 'faker'



# Create Users
5.times do
  user = User.new(
     name:    Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

#Create Topics
15.times do
  Topic.create!(
    name:        Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
  )
end
topics = Topic.all

 # Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.
 
 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.
 
 # The `save` method then saves this User to the database.

#Create Posts
160.times do
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
    )
end
posts = Post.all


# Create Summaries
5.times do
   Summary.create!(
     name:         Faker::Lorem.sentence,
     description:  Faker::Lorem.paragraph
   )
 end
Summaries = Summary.all


#Create Comments
100.times do 
  Comment.create!(
    # user: users.sample,   # we have not yet associated Users with Comments
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
end

unique_post = [{title: "This is a new unique title", body: "This is a unique body"}]

unique_post.each do |attributes|
   Post.create(attributes) unless Post.where(attributes).first
end

#Create ads
15.times do
  Advertisement.create!(
    # post: posts.sample,
    body: Faker::Commerce.product_name,
    title: Faker::Lorem.sentence(3, true),
    price: Faker::Commerce.price
    )

end

# Create an admin user
 admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
  )
 admin.skip_confirmation!
 admin.save!

 # Create a moderator user
 moderator = User.new(
  name: 'Moderator User',
  email: 'moderator@example.com',
  password: 'helloworld',
  role: 'moderator'
  )
 moderator.skip_confirmation!
 moderator.save!

  # Create a member
 member = User.new(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld',
 )
 member.skip_confirmation!
 member.save!



puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Summary.count} summaries created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} adverts created"