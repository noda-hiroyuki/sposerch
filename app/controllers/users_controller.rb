class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def mypage
    #ログインユーザー情報の取得
    @user = User.find(current_user.id)

    #登録イベントの取得
    gon.event_data = current_user.entry_events

  end

  def edit
    #ログインユーザー情報の取得
    @user = User.find(current_user.id)
  end

  def erase
    #ログインユーザー情報の取得
    @user = User.find(current_user.id)
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to login_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def update
    User.find(current_user.id).update_attributes(mypage_params)
    redirect_to users_mypage_path
  end

  def destroy
    user = User.find(current_user.id)
    if user.destroy
      redirect_to root_path, success: '会員削除しました'
    else
      flash.now[:danger] = "会員削除できませんでした"
    end
  end

  def user_info_check
    if(params[:email] != nil)
      emailcheck
    end

    if(params[:name] != nil)
      namecheck
    end
  end


  def emailcheck
    if(User.find_by(email: params[:email]) == nil)
      used_email_messeage = {'messeage' => '使用できます'}
    else
      used_email_messeage = {'messeage' => '使用されています'}
    end

    render :json => used_email_messeage
  end

  def namecheck
    if(User.find_by(name: params[:name]) == nil)
      used_name_messeage = {'messeage' => '使用できます'}
    else
      used_name_messeage = {'messeage' => '使用されています'}
    end

    render :json => used_name_messeage
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def mypage_params
    params.require(:user).permit(:name, :email, :image, :splike, :comment)
  end

end
