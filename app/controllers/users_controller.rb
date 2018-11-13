class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def mypage
    #ログインユーザー情報の取得
    @user = User.find(current_user.id)

    gon.event_data = Event.all
    #binding.pry
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
    @user = User.new(user_params)
    if @user.save
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
    user.destroy
    binding.pry
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  private
  def mypage_params
    params.require(:user).permit(:name, :email, :image, :splike, :comment)
  end

end
