class MovieWatchlistsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :show_entry]

  def create
    @entry = MovieWatchlist.create!(
        user_id: params[:user_id],
        movie_id: params[:movie_id],
        title: params[:movie_title],
        image_url: params[:image_url],
        status: params[:status],
        score: params[:score]
    )

    unless params[:score].nil?
      MovieScore.upsert({
                            score: score_average(@entry.movie_id),
                            title: @entry.title,
                            movie_id: @entry.movie_id,
                            members: count_members(@entry.movie_id),
                            image_url: @entry.image_url,
                            created_at: DateTime.now,
                            updated_at: DateTime.now
                        }, unique_by: :movie_id)
    end


      render json: "Created successfully."
    end

  def show
    user = User.find_by_username(params[:id])
    watchlist = MovieWatchlist.all.where(:user_id => user.id)
                    .select(:id, :movie_id, :title, :status, :image_url, :score, :updated_at)

    render json: watchlist
  end

  def show_entry
    watchlist = MovieWatchlist.all.where(:user_id => params[:user_id])
    entry = watchlist.find_by(movie_id: params[:movie_id])

    render json: entry
  end

  def update
    MovieWatchlist.find(params[:id]).update!(:status => params[:status], :score => params[:score])
    @entry = MovieWatchlist.find(params[:id])

    unless params[:score].nil?
      MovieScore.upsert({
          score: score_average(@entry.movie_id),
          title: @entry.title,
          movie_id: @entry.movie_id,
          members: count_members(@entry.movie_id),
          image_url: @entry.image_url,
          created_at: DateTime.now,
          updated_at: DateTime.now
      }, unique_by: :movie_id)
    end


    render json: @entry
  end

  private

  def score_average(movie_id)
    sum = 0
    entries = MovieWatchlist.where(movie_id: movie_id)
    entries.find_each do |entry|
      sum += entry.score
    end
    (sum.to_f/entries.length).round(2)
  end

  def count_members(movie_id)
    entries = MovieWatchlist.where(movie_id: movie_id)
    entries.length
  end
end