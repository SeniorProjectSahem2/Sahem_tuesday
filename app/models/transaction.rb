class Transaction < ActiveRecord::Base
  belongs_to :item
  belongs_to :rental
  belongs_to :borrower, class_name: "User"
  belongs_to :lender, class_name: "User"
  
  def current?
    self.start_date <= Date.today and Date.today <=self.end_date
  end
  def past?
    !(self.start_date <= Date.today and Date.today <=self.end_date)
  end
  def days
    (end_date - start_date).to_i
  end
end
