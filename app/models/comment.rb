class Comment < ApplicationRecord
  # userおよび,prototypeに対するアソシエーション
  belongs_to :user
  belongs_to :prototype

  validates :text, presence: true
end

