class Rental < ActiveRecord::Base
  after_create :set_to_pending
  belongs_to :user 
  belongs_to :item 
  has_one :contract
  has_many :notifications , through: :user 
  
  scope :pending,        -> { where(status: 'pending') }
  scope :current,        -> { where(status: 'accepted').where("end_date>= ?", Date.today).where("start_date<= ?", Date.today) }
  scope :past,        -> { where(status: 'accepted').where("end_date<= ?", Date.today)}
  
  def days
    (end_date - start_date).to_i
  end
  
  
  private
  def set_to_pending
    self.update_attribute(:status, "pending")
  end
  
  
  end
