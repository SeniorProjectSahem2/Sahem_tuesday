# require 'rails_helper'

# feature "AddNewItems", :type => :feature do
#   it "should require the user log in before adding a item" do
#     password = "123456789"
#     u = create( :user, password: password, password_confirmation: password )

#     visit new_item_path

#     within "#new_user" do
#       fill_in "user_email", with: u.email
#       fill_in "user_password", with: password
#          user_type_id 1
#     first_name "batoul"
#     last_name "hasnah"
#     end

#     click_button "Log in"

#     within "#new_item" do
#       fill_in "item_name", with: "speakers"
#       fill_in "item_description", with: "speakers"
#       fill_in "item_quantity", with: 5
#       fill_in "item_daily_price", with: 50.0
#     end

#     click_link_or_button "Create Item"

#     expect( Item.count ).to eq(1)
#     expect( Item.name).to eq( "speakers")
#   end
# end