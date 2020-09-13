class MovieScoresController < ApplicationController
  def index
    @scores = MovieScore.all.order(score: :desc)

    render json: @scores
  end
end