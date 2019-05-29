class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

  helper_method :logged_in?, :current_user, :page_count

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  #ページ数を取得する
  def page_count(page,count,num,view)
    #結果表示ページ数のカウント
    page_count = count.divmod(num)

    if(page_count[1] == 0)
      @page_counts = page_count[0]
    else
      @page_counts = page_count[0] + 1
    end

    #ページboxの表示数
    if(@page_counts < view)
      @start_page = 1
      @end_page = @page_counts
    elsif(page + (view - 1) > @page_counts)
      @start_page = @page_counts - (view - 1)
      @end_page = @page_counts
    else
      if(page == 1)
        @start_page = page
        @end_page = page + (view - 1)
      else
        @start_page = page - 1
        @end_page = page + (view - 2)
      end
    end
  end
end
