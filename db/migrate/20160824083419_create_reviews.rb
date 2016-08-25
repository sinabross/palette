class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      
      t.string    :num                      #어떤 제품의 후기인지
      t.string    :content                  #내용
      t.string    :img_url, default:""      #첨부사진
      t.string    :username                 #글작성자
      t.string    :userseason               #글작성자의 계절타입-> 프로필사진으로 불러올 예정
      
      t.timestamps null: false
    end
  end
end
