require 'rails_helper'

RSpec.describe Post do
  

  before :each do
    @category = FactoryGirl.create(:category)
    @post = FactoryGirl.build(:post)
    @post.category = @category
    @post.save
  end


  after :each do
    @post.destroy
    @category.destroy
  end

  
  specify { expect(@post).to be_valid }

  
  describe "category" do
    it "should be present" do
      @post.category = nil
      expect(@post).to be_invalid

      @post.category = FactoryGirl.build(:category)
      expect(@post).to be_valid
    end
  end


  describe "content" do
    it "should be present" do
      @post.content = nil
      expect(@post).to be_invalid

      @post.content = "This would be a bunch of <span>html</span> content."
      expect(@post).to be_valid
    end
  end


  describe "default sort order" do
    it "should return posts ordered by the newest to oldest" do
      post1 = FactoryGirl.create(:post, category: @category)
      post2 = FactoryGirl.create(:post, category: @category)
      post3 = FactoryGirl.create(:post, category: @category)
      expect(Post.all.first).to eq(post3)
      expect(Post.all.second).to eq(post2)
      expect(Post.all.third).to eq(post1)
      expect(Post.all.fourth).to eq(@post)
      post3.destroy
      post2.destroy
      post1.destroy
    end
  end


  describe "description" do
    it "should be present" do
      @post.description = nil
      expect(@post).to be_invalid

      @post.description = "A short description."
      expect(@post).to be_valid
    end
  end


  describe "slug" do 
    it "should replace any non word character with '-' on the title" do
      @post.title = "a couple of spaces"
      expect(@post.slug).to eq("a-couple-of-spaces")

      @post.title = "aren't we special!"
      expect(@post.slug).to eq("aren-t-we-special-")

      @post.title = "!@#$%^&*(),./\"'?"
      expect(@post.slug).to eq("----------------")
    end
  end


  describe "title" do
    it "should be present" do
      @post.title = nil
      expect(@post).to be_invalid

      @post.title = "I'm a title."
      expect(@post).to be_valid
    end
  end


  describe "to_param" do
    it "should return the id, a '-', then the title" do
      @post.title = "foo"
      expect(@post.to_param).to eq("#{@post.id}-foo")
    end
  end


end
