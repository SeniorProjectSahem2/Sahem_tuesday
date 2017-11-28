require 'rails_helper'

RSpec.describe "transactions/new", type: :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      :item_name => "MyString",
      :borrower_id => 1,
      :lender_id => 1,
      :item => nil,
      :rental => nil
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "input#transaction_item_name[name=?]", "transaction[item_name]"

      assert_select "input#transaction_borrower_id[name=?]", "transaction[borrower_id]"

      assert_select "input#transaction_lender_id[name=?]", "transaction[lender_id]"

      assert_select "input#transaction_item_id[name=?]", "transaction[item_id]"

      assert_select "input#transaction_rental_id[name=?]", "transaction[rental_id]"
    end
  end
end
