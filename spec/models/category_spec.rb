require 'rails_helper'

RSpec.describe Category do
  

  before :each do
    @category = FactoryGirl.build(:category)
  end

  
  specify { expect(@category).to be_valid }

  
  describe "description" do
    it "should be present" do
      @category.description = nil
      expect(@category).to be_invalid

      @category.description = "A short description."
      expect(@category).to be_valid
    end
  end


  describe "slug" do 
    it "should replace any non word character with '-' on the title" do
      @category.title = "a couple of spaces"
      expect(@category.slug).to eq("a-couple-of-spaces")

      @category.title = "aren't we special!"
      expect(@category.slug).to eq("aren-t-we-special-")

      @category.title = "!@#$%^&*(),./\"'?"
      expect(@category.slug).to eq("----------------")
    end
  end


  describe "title" do
    it "should be present" do
      @category.title = nil
      expect(@category).to be_invalid

      @category.title = "I'm a title."
      expect(@category).to be_valid
    end
  end


  describe "to_param" do
    it "should return the id, a '-', then the title" do
      @category.title = "foo"
      expect(@category.to_param).to eq("#{@category.id}-foo")
    end
  end


end
