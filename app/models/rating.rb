class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  

   def avg_rating
        rating = Rating.where(item_id: self.id)
        sum = 0
         rating.each  do |r| 
           sum = sum + r.stars

        #   if r.blank?
        #     @avg_rating= 0
        #   else
        #     @avg_rating = r.average(:stars).round(2)
          end 
           
           if rating.count==0
             avg=0
          else
            avg = sum/rating.count
          end
           
   end 
  
end 
