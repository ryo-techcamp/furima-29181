class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash [:genre, :sutum, :sora, :place, :day]

validates :image, :name, :description, :genre,:sutum,:sora,:place,:day,  presence: true

validates :genre_id,:sutum_id,:sora_id,:place_id,:day_id, numericality: { other_than: 1 } 

validates :price, :numericality => { :greater_than_or_equal_to => 300 }  
validates :price, :numericality => { :less_than => 9999999 } 

belongs_to :user
has_one :buyer
end
