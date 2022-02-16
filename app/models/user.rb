  class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :products, dependent: :destroy
  has_one_attached :image
  has_many :suggestions, as: :suggestionable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :omniauthable, :omniauth_providers => [:github, :facebook]
end



def self.from_omniauth(auth)  
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
end

def image_thumbnail
  if image.attached?
  image.variant(resize: "150x150!").processed 
  else
    '/default_profile.jpg'
  end
end

end
