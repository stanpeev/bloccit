require 'faker'

#Create Posts
50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end
posts = Post.all

#Create Comments
100.times do 
  Comment.create!(
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

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} adverts created"