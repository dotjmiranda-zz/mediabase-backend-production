class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_one :profile, dependent: :destroy
  has_many :movie_watchlists, dependent: :destroy
  has_many :watchlist_series, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create :build_profile

  private

  def build_profile
    Profile.create!(user_id: self.id)
  end
end
