require 'rails_helper'

RSpec.describe "transactions/show", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :item_name => "Item Name",
      :borrower_id => 2,
      :lender_id => 3,
      :item => nil,
      :rental => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Item Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
