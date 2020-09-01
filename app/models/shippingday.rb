class Shippingday < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :day
  
    #空の投稿を保存できないようにする
    validates :title, :text, :day, presence: true

    #ジャンルの選択が「--」の時は保存できないようにする
    validates :day_id, numericality: { other_than: 1 } 
end
