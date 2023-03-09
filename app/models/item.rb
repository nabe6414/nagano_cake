class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  validates :is_active, inclusion: {in: [true, false]}
  validates :image, presence: true
end
