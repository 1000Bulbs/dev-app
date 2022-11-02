require 'rails_helper'

RSpec.describe "Fizzbuzz", type: :request do
  describe "GET fizz" do
    it 'returns a successful response' do
      get '/fizzbuzz/fizz'
      expect(response.body).to eq('fizz 4 5 fizz 7 8 fizz 10 11 fizz 13 14 fizzbuzz 16 17 fizz 19 20 fizz 22 23 fizz 25 26 fizz 28 29 fizzbuzz 31 32 fizz 34 35 fizz 37 38 fizz 40 41 fizz 43 44 fizzbuzz 46 47 fizz 49 50 fizz 52 53 fizz 55 56 fizz 58 59 fizzbuzz 61 62 fizz 64 65 fizz 67 68 fizz 70 71 fizz 73 74 fizzbuzz 76 77 fizz 79 80 fizz 82 83 fizz 85 86 fizz 88 89 fizzbuzz 91 92 fizz 94 95 fizz 97 98 fizz 100')
    end
  end
end