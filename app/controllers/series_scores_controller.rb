class SeriesScoresController < ApplicationController
  def index
    @scores = SeriesScore.all.order(score: :desc)

    render json: @scores
  end
end