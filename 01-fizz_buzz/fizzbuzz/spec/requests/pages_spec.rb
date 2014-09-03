require 'rails_helper'

RSpec.describe "Pages", :type => :request do
  
#  subject { page }
  
  describe "GET /fizzbuzz" do
    it "doesn't write haiku" do
      get 'fizzbuzz', num: "7"

      expect(response.status).to be(200)
      #puts response.body
      expect(response.body).to include("No Haiku 4 U")
    end

    it "mod 3" do
      get 'fizzbuzz', num: "9"

      expect(response.status).to be(200)
      expect(response.body).to include("alka-seltzer")
    end

    it "mod 5" do
      get 'fizzbuzz', num: "25"

      expect(response.status).to be(200)
      expect(response.body).to include("fizzing")
    end

    it "mod 15" do
      get 'fizzbuzz', num: "30"

      expect(response.status).to be(200)
      expect(response.body).to include("fizzing humming")
    end


  end
end
