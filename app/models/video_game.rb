class VideoGame < ApplicationRecord
  validates :title,        presence: true
  validates :url,          presence: true
  validates :release_date, presence: true
end
