class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_secure_password
  validates :name, presence: true, length: { maximum: 50 }
  VALID_PHONE_REGEX = /\A[0-9]{3,12}\z/
  validates :phone, presence: true,
                    format: { with: VALID_PHONE_REGEX },
                    uniqueness: { case_sensitive: false }
  #validates_uniqueness_of :phone,:case_sensitive => false, :message => "该用户名已存在!"
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  before_save :create_remember_token                 
  private
	def create_remember_token
	  self.remember_token = SecureRandom.urlsafe_base64
  end
end
