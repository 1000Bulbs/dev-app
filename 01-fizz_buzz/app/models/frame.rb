class Frame < ActiveRecord::Base
  attr_accessible :answer, :correct, :game_id, :position
end
