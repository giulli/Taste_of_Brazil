require 'rails_helper'

describe Recipe do
  it "should have a valid factory" do
  	FactoryGirl.build(:recipe).should be_valid
  end
  
  it "is invalid without a title" do
    recipe = FactoryGirl.build :recipe, title: ""
    
    recipe.should_not be_valid
    recipe.errors[:title].first.should == "is too short (minimum is 3 characters)"
  end
 end