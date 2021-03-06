class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_one_attached :profile_image

  def get_image
    if image.attached?
      image
    else
        'no_image.jpg'
    end
  end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, uniqueness: true,
                   length: { minimum: 2, maximum: 20 }
  validates :introduction, length: {maximum: 50 }

end
