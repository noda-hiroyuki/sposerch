class CommentsController < ApplicationController
  #イベント詳細ページでコメント入力
  def comment_new
    create
    redirect_to topic_show_path(id: @comments.event_id)
  end

  #コメント一覧でコメント入力
  def comment_list
    create
    redirect_to topic_comment_path(id: @comments.event_id)
  end

  def create
    #コメント内容を取得
    @comments = current_user.comments.new(comment_params)

    #コメント投稿したユーザ名を取得
    @user_name = User.find_by(id: current_user.id)
    @comments.user_name = @user_name.name

    @comments.save

  end

  private
  def comment_params
    params.require(:comment).permit(:user_name, :body, :event_id)
  end
end
