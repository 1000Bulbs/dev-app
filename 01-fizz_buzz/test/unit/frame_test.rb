# == Schema Information
#
# Table name: frames
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  position   :integer
#  fizz_buzz  :string(255)
#  answer     :integer
#  correct    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FrameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
