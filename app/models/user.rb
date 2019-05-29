class User < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_secure_password

  has_many :comments
  has_many :events
  has_many :entrys
  has_many :entry_events, through: :entrys, source: 'event'

end
