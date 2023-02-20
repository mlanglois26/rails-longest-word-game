require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
  @letters = ("a".."z").to_a.sample(10)
  end

  def score
    @letters = params[:lettre]

    @word = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"

    user_serialized = URI.open(url).read
    result = JSON.parse(user_serialized)

    if result["found"]
      @answer = "english word"
    else
      @answer = "not and english word"
    end
  end
end
