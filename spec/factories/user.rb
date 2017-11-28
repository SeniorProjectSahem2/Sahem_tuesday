

FactoryGirl.define do
  factory :user, :class => 'User' do
    email 'b@gmail.com'
    password '12345678'
    password_confirmation '12345678'
    user_type_id 1
    first_name "batoul"
    last_name "hasnah"
  end
end