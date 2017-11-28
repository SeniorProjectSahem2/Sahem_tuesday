require 'rails_helper'

RSpec.describe "transactions/edit", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :item_name => "MyString",
      :borrower_id => 1,
      :lender_id => 1,
      :item => nil,
      :rental => nil
    ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "input#transaction_item_name[name=?]", "transaction[item_name]"

      assert_select "input#transaction_borrower_id[name=?]", "transaction[borrower_id]"

      assert_select "input#transaction_lender_id[name=?]", "transaction[lender_id]"

      assert_select "input#transaction_item_id[name=?]", "transaction[item_id]"

      assert_select "input#transaction_rental_id[name=?]", "transaction[rental_id]"
    end
  end
end
