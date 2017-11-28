FactoryGirl.define do 
    factory :item do 
        id 1
        name "speakers"
        description "black dell"
        size "medium"
        user_id 1
        quantity 5
        daily_price 50.0
        weekly_price 30.0
        monthly_price 25.0
    end 
end