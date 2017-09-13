class User < ApplicationRecord
  before_save :first_user_admin
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  enum role: [:client, :technician, :admin]

  has_many :tickets

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.get_technician
    where(role: :technician).limit(1)
  end

  private
    def first_user_admin
      if User.all.empty?
        self.role = :admin
      end
    end
end
