class TopicsController < ApplicationController
  def show
    #イベント情報の取得
    @event = Event.find_by(id: params[:id])

    #コメント投稿するための要素を取得
    @comment = Comment.new

    #閲覧イベントのコメントを取得
    @event_comments = @comment.get_event_comment(params[:id],3)

    #コメント数をカウント
    @comment_count = @comment.event_comment_count(params[:id])

    #関連イベントの検索
    @relates = Event.where(event: @event.event)
              .where.not(id: params[:id]).limit(7).order("date ASC")

    #登録数をカウント
    @entry_counts = Entry.where(event_id: params[:id]).count

    #同日のイベント情報を取得
    @sameday_events = Event.where(date: @event.date).where.not(id: @event.id).limit(5)

    #Javascript内で閲覧イベント情報を扱えるように取得
    gon.event = Event.find_by(id: params[:id])

  end

  def comment
    if(params[:page] != nil)
      @page = params[:page].to_i
      start = (@page - 1) * 1
    else
      @page = 1
      start = 0
    end

    #閲覧イベントコメント取得
    @comment = Comment.new
    @comment_all = @comment.get_event_comment(params[:id],10).offset(start*10)
    @count = @comment.event_comment_count(params[:id])

    #結果表示ページ数のカウント
    page_count(@page,@count,10,5)

    event = Event.find_by(id: params[:id])
    @event_title = event.title

    #新着コメント取得
    get_new_comment

    #コメント登録数取得
    event_comment_count = Event.joins(:comments).group(:event_id).count
    event_comment_ids = Hash[event_comment_count.sort_by{ |_, v| -v }].keys
    @event_comment_ranking = Event.where(id: event_comment_ids).limit(5)
    @event_commment_counts = Hash[event_comment_count.sort_by{ |_, v| -v }].values
  end

  def get_new_comment
    @comment_new = Comment.all.order("created_at DESC")

    show_count = 0
    @event_id = [""]

    @comment_new.each{|comment|
      match_flag = 0
      @event_id.each{|id|
        if(id == comment.event_id)
          match_flag += 1
          break
        end
      }

      if(match_flag == 0)
        @event_id[show_count] = comment.event_id
        show_count += 1
      end

      if(show_count == 5)
        break
      end
    }
  end
end
