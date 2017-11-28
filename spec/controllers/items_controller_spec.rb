# require 'rails_helper'

# RSpec.describe ItemsController, :type => :controller do
#   describe "anonymous user" do
#     before :each do
#       # This simulates an anonymous user
#       login_with nil
#     end

#     it "should be redirected to signin" do
#       get :home_index
#       expect( response ).to have_content("sign in")
#     end
#     it "should let a user see all the posts" do
#     login_with create( :user )
#     get :index
#     expect( response ).to render_template( :index )
#   end
#   end
# end