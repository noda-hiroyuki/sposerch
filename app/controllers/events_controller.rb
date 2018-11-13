class EventsController < ApplicationController
  def index
    #現在の日時の先のイベントを5つ取得する
    now = Time.now
    @event_now = Event.where('date >?',now ).order("date ASC").limit(5)
  end
end
