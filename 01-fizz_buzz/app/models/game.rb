# == Schema Information
#
# Table name: games
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  score          :integer
#  time_to_finish :integer
#  high_number    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Game < ActiveRecord::Base
  attr_accessible :high_number, :time_to_finish

  belongs_to :user
end
