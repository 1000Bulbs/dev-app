class Frame < ActiveRecord::Base
  include FizzBuzzable

  attr_accessible :answer

  acts_as_list :position

  before_create :set_fizz_buzz

  private

  def set_fizz_buzz
    self.fizz_buzz = fizz_buzzify(position)
  end
end
