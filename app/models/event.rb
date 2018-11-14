class Event < ApplicationRecord
  has_many :entrys
  has_many :entry_users, through: :entrys, source: 'user'
end
