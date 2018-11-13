class DataselsController < ApplicationController
  def search
    @search = Event.new

  end

  #スポーツイベントを検索,数を処理
  def show
    @results = Event.where(date: params[:datest].to_date..params[:dateen].to_date,
                           event: [params[:event][:s1],params[:event][:s2]],
                           place: params[:place][:name]).order("date ASC")

    @count = Event.where(date: params[:datest].to_date..params[:dateen].to_date,
                         event: [params[:event][:s1],params[:event][:s2]],
                         place: params[:place][:name]).count
    #binding.pry
  end
end
