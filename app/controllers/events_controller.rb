class EventsController < ApplicationController
  def index
    #現在の日時の先のイベントを5つ取得する
    now = Time.now
    @event_now = Event.where('date >?',now ).order("date ASC").limit(5)

    #新着コメント取得
    @comment_new = Comment.limit(5).order("created_at DESC")

    #イベント登録数取得
    event_entry_count = Event.joins(:entrys).group(:event_id).count
    event_entry_ids = Hash[event_entry_count.sort_by{ |_, v| -v }].keys
    @event_entry_ranking = Event.where(id: event_entry_ids).limit(5)
  end
end
