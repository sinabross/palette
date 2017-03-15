class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  
  has_many :reviews #, dependent: :destroy #dependent는 user가 탈퇴하면 그 사람이 쓴 리뷰들 자동으로 삭제하게 하는 코드
  
  
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :timeoutable, :timeout_in => 1.year, :omniauth_providers => [:facebook]
  
  validates :name, presence: true 
  validates :username, presence: true 
  validates :username, uniqueness: true
  validates :birthday, presence: true
  
  acts_as_voter  # 찜하기 되게 하기 위한 것
  
  def self.from_omniauth(auth)
       where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.name = auth.info.name
        user.username= auth.info.name
        user.birthday= Date.strptime(auth.extra.raw_info.birthday,'%m/%d/%Y')
        user.password = Devise.friendly_token[0,20]
      end
  end
  
  def self.new_with_session(params, session)
     super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
         user.email = data["email"] if user.email.blank?
         user.name = data["name"] if user.name.blank?
         user.username = data["name"] if user.username.blank?
         user.birthday = data["birthday"] if user.birthday.blank?
      end
     end
  end
  
  #로그인 세션 유지    
  def timeout_in
      1.year
  end    

end
