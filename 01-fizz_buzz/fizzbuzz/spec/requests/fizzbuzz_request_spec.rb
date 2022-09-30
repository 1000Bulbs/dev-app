require 'rails_helper'

RSpec.describe "Fizzbuzz", type: :request do
    describe "GET api/v1/fizzbuzz" do
        it "returns http success" do
            result_hash = {
                "1"=>1, "2"=>2, "3"=>"Fizz", "4"=>4, "5"=>"Buzz", "6"=>"Fizz", "7"=>7, "8"=>8, "9"=>"Fizz",
                "10"=>"Buzz", "11"=>11, "12"=>"Fizz", "13"=>13, "14"=>14, "15"=>"FizzBuzz", "16"=>16, "17"=>17,
                "18"=>"Fizz", "19"=>19, "20"=>"Buzz", "21"=>"Fizz", "22"=>22, "23"=>23, "24"=>"Fizz", "25"=>"Buzz" 
            }.to_json
            get "/api/v1/fizzbuzz?num=25"
            expect(response.status).to eq(200)
            expect(response.body).to eq(result_hash)
        end
    end
end