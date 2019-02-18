require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.shuffle[0...10]
  end

  def score
    @word = params[:word].upcase.to_s
    @letters = params[:letters].split(' ')
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    data = JSON.parse(open(url).read)

    @word.split('').sort.each do |letter|
      if @letters.include?(letter)
        @answer = "Well Done!"
      else
        @answer = "Wrong Letters Used!"
      end
    end

    if data["found"] == false
      @answer = "Word Doesn't Exist!"
    end
  end
end
