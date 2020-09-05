class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :sutum
  belongs_to_active_hash :sora
  belongs_to_active_hash :place
  belongs_to_active_hash :day

  validates :image, :name, :description, :genre_id, :sutum_id, :sora_id, :place_id, :day_id,  presence: true

  validates :genre_id, :sutum_id, :sora_id, :place_id, :day_id, numericality: { other_than: 1 }

  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than: 9_999_999 }

  belongs_to :user
  has_one :buyer
end
