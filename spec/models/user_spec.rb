require 'rails_helper' 

describe User do
  
  include TestFactories

  describe "#favorited(post)" do

    before do
      @user = authenticated_user
      @post = associated_post
    end

    it "returns 'nil' if the user has not favorited the post" do
      expect(@user.favorited(@post)).to eq(nil)
    end

    it "returns the appropriate favorite if it exists" do
      favorite = @user.favorites.create(post: @post)
      expect(@user.favorited(@post)).to eq(favorite)
    end

    it "returns `nil` if the user has favorited another post" do
      @another_post = associated_post
      @favorite = @user.favorites.create(post: @another_post)
      @favorite.save
      expect(@user.favorited(@post)).to eq(nil)
      
    end
  end

  describe ".top_rated" do
 
     before do
       @user1 = create(:user_with_post_and_comment)
 
       @user2 = create(:user_with_post_and_comment)
       @user2.comments.create(attributes_for(:comment))
     end
 
     it "returns users ordered by comments + posts" do
       expect( User.top_rated ).to eq([@user2, @user1])
     end
 
     it "stores a `posts_count` on user" do
       users = User.top_rated
       expect( users.first.posts_count ).to eq(1)
     end
 
     it "stores a `comments_count` on user" do
       users = User.top_rated
       expect( users.first.comments_count ).to eq(2)
     end
   end
end