class Shippingfee < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sora

  # 空の投稿を保存できないようにする
  validates :title, :text, :sora, presence: true

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :sora_id, numericality: { other_than: 1 }
end
