class CommentsController < ApplicationController
  def create
    #コメント内容を取得
    @comments = current_user.comments.new(comment_params)

    #コメント投稿したユーザ名を取得
    @user_name = User.find_by(id: current_user.id)
    @comments.user_name = @user_name.name

    @comments.save
    redirect_to topicid_show_path(id: @comments.event_id)

  end

    private
    def comment_params
      params.require(:comment).permit(:user_name, :body, :event_id)
    end
end
