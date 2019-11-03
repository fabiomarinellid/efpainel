class User < ApplicationRecord
  belongs_to :site

  enum role: {:full_access => 0, :restricted_access => 1}


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  mount_uploader :photoavatar, PhotoavatarUploader

end
