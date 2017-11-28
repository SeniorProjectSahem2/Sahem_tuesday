require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  before(:each) do
    assign(:transactions, [
      Transaction.create!(
        :item_name => "Item Name",
        :borrower_id => 2,
        :lender_id => 3,
        :item => nil,
        :rental => nil
      ),
      Transaction.create!(
        :item_name => "Item Name",
        :borrower_id => 2,
        :lender_id => 3,
        :item => nil,
        :rental => nil
      )
    ])
  end

  it "renders a list of transactions" do
    render
    assert_select "tr>td", :text => "Item Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
