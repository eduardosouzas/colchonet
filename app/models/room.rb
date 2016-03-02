class Room < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :user
  scope :most_recent, -> { order('created_at DESC') }
  def self.search(query)
    if query.present?
      where(['location LIKE :query OR title LIKE :query OR description LIKE :query', query: "%#{query}%"])
    else
      all
    end
  end
  def complete_name
    "#{title}, #{location}"
  end
end
