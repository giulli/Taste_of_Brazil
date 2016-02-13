require 'rails_helper'

feature 'Cookbook' do 
	scenario "Home Page" do
		visit root_path

		page.should have_content ("Taste of Brazil")
	end
	
end