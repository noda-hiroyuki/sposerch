class EntrysController < ApplicationController

  def create
    entry = Entry.new
    entry.user_id = current_user.id
    entry.event_id = params[:event_id]

    if entry.save
      redirect_to topic_show_path(id: entry.event_id), success: 'イベントを登録しました'
    else
      redirect_to topic_show_path(id: entry.event_id), danger: 'イベントの登録に失敗しました'
    end
  end

  def destroy
    entry = Entry.find_by(user_id: current_user.id,event_id: params[:event_id])

    if entry.destroy
      redirect_to topic_show_path(id: params[:event_id]), success: 'イベント登録を解除しました'
    else
      redirect_to topic_show_path(id: params[:event_id]), danger: 'イベント登録の解除に失敗しました'
    end
  end
end
