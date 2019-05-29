class DataselsController < ApplicationController
  def search
    @search = Event.new
  end

  def keyword
    #検索パラメータの取得
    @keyword = params[:keyword]

    if(params[:page] != nil)
      @page = params[:page].to_i
      start = (@page - 1) * 1
    else
      @page = 1
      start = 0
    end

    obj = Event.new

    @results = obj.keyword_search(@keyword,1,start)
    @count = obj.keyword_search_count(@keyword)

    page_count(@page,@count,1,3)

  end

  #スポーツイベントをカテゴリ検索,数を処理
  def category
    #検索パラメータの取得
    @datest = params[:datest]
    @dateen = params[:dateen]

    if(params[:page] != nil)
      @page = params[:page].to_i
      start = (@page - 1) * 1
      @place = params[:place]
      @event = params[:event]
    else
      @page = 1
      start = 0
      @place = params[:place][:name]
      @event = params[:eve][:s1],params[:eve][:s2],params[:eve][:s3],params[:eve][:s4],
               params[:eve][:s5],params[:eve][:s6],params[:eve][:s7],params[:eve][:s8],
               params[:eve][:s9],params[:eve][:s10]
    end

    obj = Event.new

    #選択要素による検索
    @results = obj.category_search(@datest,@dateen,@event,@place,1,start)

    #検索件数
    @count = obj.category_search_count(@datest,@dateen,@event,@place)

    page_count(@page,@count,1,3)

  end

end
