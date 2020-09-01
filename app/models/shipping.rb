class Shipping < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :place

    #空の投稿を保存できないようにする
    validates :title, :text, :place, presence: true

    #ジャンルの選択が「--」の時は保存できないようにする
    validates :place_id, numericality: { other_than: 1 }
end
