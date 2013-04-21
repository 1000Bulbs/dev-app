class Frame < ActiveRecord::Base
  include FizzBuzzable

  attr_accessible :answer

  belongs_to :game

  # acts_as_list :position, scope: :game_id

  after_commit :set_fizz_buzz

  private

  def set_fizz_buzz
    if fizz_buzz.empty?
      self.fizz_buzz = fizz_buzzify(position)
      save
    end
  end

  def options

  end
end
