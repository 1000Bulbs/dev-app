class Game < ActiveRecord::Base
  attr_accessible :high_number, :score, :time_to_finish, :user_id
end
