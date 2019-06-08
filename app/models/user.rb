class User < ApplicationRecord
  has_secure_password

  validates_uniqueness_of :username  , {case_sensitive: false}
  validates_uniqueness_of :email, {case_sensitive: false}

  validates :username, presence: true

  validates :password_digest, presence: true

  validates :email , presence: true

  has_many :messages

end
