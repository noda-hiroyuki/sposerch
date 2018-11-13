class TopicsController < ApplicationController
  def show
    #イベント情報の取得
    @event = Event.find_by(id: params[:id])

    #コメント投稿するための要素を取得
    @comment = Comment.new

    #閲覧イベントのコメントを取得
    @event_comments = Comment.where(event_id: params[:id])

    #コメント数をカウント
    @comment_count = Comment.where(event_id: params[:id]).count

    #関連イベントの検索
    @relates = Event.where(event: @event.event)
              .where.not(id: params[:id]).order("date ASC")

  end
end
