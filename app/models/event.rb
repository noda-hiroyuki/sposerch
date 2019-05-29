class Event < ApplicationRecord
  has_many :entrys
  has_many :entry_users, through: :entrys, source: 'user'
  has_many :comments

  def keyword_search(keyword,show,start)
    Event.where('title like ?', "%#{keyword}%").limit(show).offset(start).order("date ASC")
  end

  def keyword_search_count(keyword)
    Event.where('title like ?', "%#{keyword}%").count
  end

  def category_search(datest,dateen,event,place,show,start)
    Event.where(date: datest.to_date..dateen.to_date,
                          num: event,place: place).limit(show).offset(start).order("date ASC")
  end

  def category_search_count(datest,dateen,event,place)
    Event.where(date: datest.to_date..dateen.to_date,
                          num: event,place: place).count
  end
end
