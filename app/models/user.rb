class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :reviews, dependent: :destroy #dependent는 user가 탈퇴하면 그 사람이 쓴 리뷰들 자동으로 삭제하게 하는 코드
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :username, presence: true 
  validates :username, uniqueness: true
  
      
  
  acts_as_voter
         
end
