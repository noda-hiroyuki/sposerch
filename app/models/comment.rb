class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  belongs_to :event, optional: true

  def get_event_comment(event_id,show)
    Comment.where(event_id: event_id).limit(show).order("created_at ASC")
  end

  def event_comment_count(event_id)
    Comment.where(event_id: event_id).count
  end
end
