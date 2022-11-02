class FizzbuzzController < ApplicationController
  def fizz
    
    # haiku
    TheComputer.will do |computation|
      computation.will_be_upto 'hundred'
    computation.done_before_the end

    render json: TheComputer.computation.result
  end
end
