class Comment < ApplicationRecord

  validates :body, presence: true

  belongs_to :user
  belongs_to :event, optional: true
end
