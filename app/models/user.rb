class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader
  has_many :collections
  has_many :banks
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
