FactoryGirl.define do 
    factory :rental do 
        quantity 2
        start_date "2017-11-15"
        end_date "2017-11-22"
        status "accepted"
        user_id 1
        item_id 1
    end 
end