class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many_attached :files, dependent: :destroy

  validates :title, :body, presence: true
end
