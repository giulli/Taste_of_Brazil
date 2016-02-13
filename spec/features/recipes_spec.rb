require 'rails_helper'

feature 'Recipes:' do
  scenario 'User creates a recipe' do
   login_a_user
   
   visit recipes_path
   click_link "New Recipe"
   
   fill_in "Title", with: "My new test recipe"
   fill_in "Ingredients", with: "Arroz, feijao e farofa"
   fill_in "Directions", with: "Junta tudo e come"
   click_button "Create Recipe"
   
   page.should have_content("My new test recipe")
  end
  
  scenario 'User fails to create recipe' do
    login_a_user
   
    visit new_recipe_path
   
    fill_in "Title", with: ""
    fill_in "Ingredients", with: ""
    fill_in "Directions", with: ""
    click_button "Create Recipe"
   
    page.should have_content("fix the errors")
  end

  scenario "User Edits/Updates Recipe (right after creating it)" do
    user = login_a_user
   
    recipe = FactoryGirl.create :recipe, user: user
    visit recipe_path(recipe)

    click_link "Edit Recipe"
    fill_in "Title", with: "New Title"
    click_button "Update Recipe"

    page.should have_content("New Title")
  end

  scenario "User Destroys Recipe" do
    user = login_a_user
   
    recipe = FactoryGirl.create :recipe, user: user
    visit recipe_path(recipe)

    click_link "Delete Recipe"

    page.should_not have_content("My new test recipe")
  end
  
  scenario "User should only see his recipes" do
    user = login_a_user
    recipe1 = FactoryGirl.create :recipe, user: user #Passing the logged in user to make this recipe belong to him.
    recipe2 = FactoryGirl.create :recipe #This recipe will belong to a newly generated user by the factory
    
    visit recipes_path
    page.should have_content(recipe1.title)
    page.should_not have_content(recipe2.title)
  end
end