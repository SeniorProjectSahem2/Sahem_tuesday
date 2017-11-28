require 'test_helper'

class ItemTest < ActiveSupport::TestCase
            should belong_to(:category)
            should belong_to(:user).dependent(:destroy)
            should have_many(:rentals).dependent(:destroy)

end
