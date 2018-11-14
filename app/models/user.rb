class User < ApplicationRecord
  #ユーザー名は、15字以内、未入力はNG
  validates :name, presence: true, length: {maximum: 15}
  #メールアドレスは、〜@~.~のみ、未入力はNG
  VALID_MAIL_REGEX =  /\A[\w+\-]+@[a-z\d\.]+\.[a-z]+\z/
  validates :email, presence: true, format: { with: VALID_MAIL_REGEX }
  #パスワードは8文字以上20字以内  ユーザー編集時は、何も入力しない(nil)でも許可する
  VALID_PASSWORD_REGEX =  /(?=.*?\d)(?=.*?[a-zA-Z])[0-9a-zA-Z]{8,20}/
  validates :password, length: {in: 8..20},format: { with: VALID_PASSWORD_REGEX },allow_nil: true

  mount_uploader :image, ImageUploader

  has_secure_password

  has_many :comments
  has_many :events
  has_many :entrys
  has_many :entry_events, through: :entrys, source: 'event'

end
