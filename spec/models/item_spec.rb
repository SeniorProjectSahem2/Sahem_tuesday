require "rails_helper"

RSpec.describe Item, :type => :model do
    before(:all) do 
        @item = Item.new(id: 1, name: "speakers", description: "black dell", size: "medium", user_id: 10, quantity: 5)
  
    end
  it "it should create an with right input" do
        expect(@item.name).to eq("speakers")
        expect(@item.description).to eq("black dell")
  end
  it "is not valid without a name" do
      item = Item.new(id: 1, name: nil, description: "black dell", size: "medium", user_id: 10, quantity: 5)
      expect(item).to_not be_valid
  end
  it "is not valid with wrong input type" do
      item = Item.new(id: 1, name: 2, description: "black dell", size: "medium", user_id: 10, quantity: 5)
      expect(item).to_not be_valid
  end 
  it "quantity_left is correct" do
      item = Item.new(id: 1, name: "speakers", description: "black dell", size: "medium", user_id: 10, quantity: 5)
      expect(item.quantity_left).to eq(5)
  end
  it { should have_many(:rentals) }
  it { should belong_to(:user) }
  
  it { should belong_to(:category) }
end