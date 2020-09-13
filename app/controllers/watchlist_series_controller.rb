class WatchlistSeriesController < ApplicationController
  def create
    @entry = WatchlistSeries.create!(
        user_id: params[:user_id],
        series_id: params[:series_id],
        title: params[:series_title],
        image_url: params[:image_url],
        status: params[:status],
        score: params[:score]
    )

    unless params[:score].nil?
      SeriesScore.upsert({
         score: score_average(@entry.series_id),
         title: @entry.title,
         series_id: @entry.series_id,
         members: count_members(@entry.series_id),
         image_url: @entry.image_url,
         created_at: DateTime.now,
         updated_at: DateTime.now
      }, unique_by: :series_id)
    end

    render json: "Create successfully"
  end

  def show
    user = User.find_by_username(params[:id])
    watchlist = WatchlistSeries.all.where(:user_id => user.id)
                    .select(:id, :series_id, :title, :status, :image_url, :score, :updated_at)

    render json: watchlist
  end

  def show_entry
    @watchlist = WatchlistSeries.all.where(:user_id => params[:user_id])
    @entry = @watchlist.find_by(series_id: params[:series_id])

    render json: @entry
  end

  def update
    WatchlistSeries.find(params[:id]).update!(:status => params[:status], :score => params[:score])
    @entry = WatchlistSeries.find(params[:id])

    unless params[:score].nil?
      SeriesScore.upsert({
         score: score_average(@entry.series_id),
         title: @entry.title,
         series_id: @entry.series_id,
         members: count_members(@entry.series_id),
         image_url: @entry.image_url,
         created_at: DateTime.now,
         updated_at: DateTime.now
      }, unique_by: :series_id)
    end

    render json: @entry
  end

  private

  def score_average(series_id)
    sum = 0
    entries = WatchlistSeries.where(series_id: series_id)
    entries.find_each do |entry|
      sum += entry.score
    end
    (sum.to_f/entries.length).round(2)
  end

  def count_members(series_id)
    entries = WatchlistSeries.where(series_id: series_id)
    entries.length
  end
end