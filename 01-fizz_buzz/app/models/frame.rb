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

class Frame < ActiveRecord::Base
  include FizzBuzzable

  attr_accessible :answer

  belongs_to :game

  acts_as_list :scope => :game

  before_create :set_fizz_buzz
  before_update :mark

  def options
    unique_random(5, position, [fizz_buzzify(position)]).inject([]) do |acc, option|
      acc << [option, false]
    end.shuffle
  end

  private

  def mark
    self.correct = fizz_buzz == answer
  end

  def set_fizz_buzz
    self.fizz_buzz ||= fizz_buzzify(position)
  end

  def unique_random(count, median, excluded_values = [])
    while excluded_values.size <= count
      random_fizz = fizz_buzzify([Random.rand(median-10..median+10), 1].max)

      unless excluded_values.include?(random_fizz)
        excluded_values << random_fizz
      end

      unique_random(count, median, excluded_values)
    end

    excluded_values
  end
end
