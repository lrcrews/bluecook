require 'rails_helper'

RSpec.describe PostsController, type: :controller do


  describe "GET home" do

    before :each do
      @category = FactoryGirl.create(:category)
      10.times { FactoryGirl.create(:post, category: @category) }
      @posts = Post.all.limit(6)
    end

    after :each do
      Post.destroy_all
      @category.destroy
    end

    it "assigns @posts" do
      get :home
      expect(assigns(:posts)).to eq(@posts.to_a)
    end

    it "should assign at most 6 posts to @posts" do
      get :home
      expect(assigns(:posts).count).to eq(6)
    end

    it "renders the 'home' template" do
      get :home
      expect(response).to render_template("home")
    end

  end


  describe "GET index" do

    before :each do
      @category = FactoryGirl.create(:category)
      10.times { FactoryGirl.create(:post, category: @category) }
      @posts = Post.all
    end

    after :each do
      Post.destroy_all
      @category.destroy
    end

    it "assigns @posts" do
      get :index
      expect(assigns(:posts)).to eq(@posts.to_a)
    end

    it "renders the 'index' template" do
      get :index
      expect(response).to render_template("index")
    end

  end


  describe "GET show/:id" do

    before :each do
      @category = FactoryGirl.create(:category)
      @post = FactoryGirl.create(:post, category: @category)
    end

    after :each do
      @post.destroy
      @category.destroy
    end

    it "redirects to the posts index url if the post requested doesn't exist" do
      get :show, id: 0
      expect(response).to redirect_to(posts_url)
    end

    it "response body contains @post" do
      get :show, id: @post.id
      expect(assigns[:post]).to eq(@post)
    end

    it "renders the show template" do
      get :show, id: @post.id
      expect(response).to render_template("show")
    end
  end

end
