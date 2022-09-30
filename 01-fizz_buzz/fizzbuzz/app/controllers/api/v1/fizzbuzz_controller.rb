class Api::V1::FizzbuzzController < ApplicationController
    def fizzbuzz
        num = params[:num].present? ? params[:num].to_i : 100
        hash = Hash.new

        1.upto(num).each do |i|
            if(i % 3 == 0 && i % 5 == 0)
                hash[i] = "FizzBuzz"
            elsif i %3==0
                hash[i] = "Fizz"
            elsif i%5==0
                hash[i] = "Buzz"
            else
                hash[i] = i
            end
        end

        render json: hash
    end
end
