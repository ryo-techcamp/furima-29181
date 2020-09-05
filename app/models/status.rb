class Status < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sutum

  # 空の投稿を保存できないようにする
  validates :title, :text, :sutum, presence: true

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :sutum_id, numericality: { other_than: 1 }
end
