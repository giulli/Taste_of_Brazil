require 'rails_helper'

feature 'Authentication' do
  scenario 'User logins correctly' do
    user = FactoryGirl.create :user, email: "fred@fred.com", password: "secret"
    visit login_path
    
    fill_in :email, with: "fred@fred.com"
    fill_in :password, with: "secret"
    click_button "Login"
    
    current_path.should eq(root_path)
  end
end