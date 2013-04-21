class Frame < ActiveRecord::Base
  include FizzBuzzable

  attr_accessible :answer

  belongs_to :game

  # acts_as_list :position, scope: :game_id

  before_create :set_fizz_buzz

  private

  def set_fizz_buzz
    self.fizz_buzz = fizz_buzzify(position)
  end
end
