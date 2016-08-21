class Lipdb < ActiveRecord::Base
    belongs_to :user 
    acts_as_votable # for 찜하기 기능
    
     
    def self.get_w_lip
        return Lipdb.where(wc:"웜").all
    end
    
    def  self.get_c_lip
        return Lipdb.where(wc:"쿨").all
    end
    
    def self.search(search, search2, search3)
      where("name LIKE ? OR brand LIKE ? OR wc LIKE ? OR pro_type LIKE ? OR tone LIKE ?",
      "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%").where("name LIKE ? OR brand LIKE ? OR wc LIKE ? OR pro_type LIKE ? OR tone LIKE ?",
      "%#{search2}%", "%#{search2}%", "%#{search2}%", "%#{search2}%", "%#{search2}%").where("name LIKE ? OR brand LIKE ? OR wc LIKE ? OR pro_type LIKE ? OR tone LIKE ?",
      "%#{search3}%", "%#{search3}%", "%#{search3}%", "%#{search3}%", "%#{search3}%")
    end
    
end
