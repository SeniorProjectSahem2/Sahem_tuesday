class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  belongs_to :user_type
  has_many :rentals ,  dependent: :destroy
  has_many :items , dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id ,  dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :transactions , dependent: :destroy
  
  
  ##validations 
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true 

  ##############################################################
  
  ##paperclip 


   has_attached_file :profilepic, styles:{large: "600x600>", medium:"300x300>"}
   validates_attachment_content_type :profilepic, content_type:/\Aimage\/.*\Z/


  
  #### paperclip
   
  #scopes
  scope :current_borrowed_items,      ->(id) { Item.joins(:rentals).where("user_id = ?", id).where("end_date>= ?", Date.today).where("status = ?","accepted") }
  scope :past_borrowed_items,      ->(user_id) { Rental.where("user_id = ?", user_id).where("end_date<= ?", Date.today).where("status = ?","accepted") }
  scope :pending_requests,      ->(user_id) { Rental.where("user_id = ?", user_id).where("end_date<= ?", Date.today).where("status = ?","pending") }

  #scope :Rental_request,       ->(user_id) { joins(:items).where(items: {user_id: user_id}).joins}
 def Rental_request
   user_items= Item.where(user_id: self.id)
   temp = []
   user_items.each do |item| 
   temp = temp+Rental.where(item_id: item.id).where(status: "pending").order(:start_date)
  end 
  temp
 end
  def ongoing_transaction
    temp = []
    Transaction.all.each do |t|
      if t.current? and t.borrower_id == self.id
        temp = temp +[t]
      end
      if t.current? and t.lender_id == self.id
        temp = temp +[t]
      end
    end
    temp
end
def past_transaction
    temp = []
    Transaction.all.each do |t|
      if t.past? and t.borrower_id == self.id
        temp = temp +[t]
      end
      if t.past? and t.lender_id == self.id
        temp = temp +[t]
      end
    end
    temp
end
 def pending_request(item)
   rental_request = Rental.where(item_id: item).where(user_id: self.id).where("status = ?","pending") 
  end
 
  
  def name
    "#{first_name} #{last_name}"
  end
end
