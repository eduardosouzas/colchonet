class Room < ActiveRecord::Base
  extend FriendlyId

  validates_presence_of :title
  validates_presence_of :slug

  mount_uploader :picture, PictureUploader
  friendly_id :title, use: [:slugged, :history]

  has_many :reviews, dependent: :destroy
  belongs_to :user
  scope :most_recent, -> { order('created_at DESC') }

  def self.search(query)
    if query.present?
      # for sqlite3  where(['location LIKE :query OR title LIKE :query OR description LIKE :query', query: "%#{query}%"])
      # for PostgreSQL
      where(['location ILIKE :query OR title ILIKE :query OR description ILIKE :query', query: "%#{query}%"])
    else
      all
    end
  end
  def complete_name
    "#{title}, #{location}"
  end
end
