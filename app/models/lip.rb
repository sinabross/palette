class Lip < ActiveRecord::Base

 def self.get_w_lip
        return Lip.where(wc:"웜").all
 end
    
 def  self.get_c_lip
        return Lip.where(wc:"쿨").all
 end
    
 def self.search(search, search2, search3)
      where("name LIKE ? OR brand LIKE ? OR season LIKE ? OR pro_type LIKE ? OR keyword LIKE ?",
      "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%").where("name LIKE ? OR brand LIKE ? OR season LIKE ? OR pro_type LIKE ? OR keyword LIKE ?",
      "%#{search2}%", "%#{search2}%", "%#{search2}%", "%#{search2}%", "%#{search2}%").where("name LIKE ? OR brand LIKE ? OR season LIKE ? OR pro_type LIKE ? OR keyword LIKE ?",
      "%#{search3}%", "%#{search3}%", "%#{search3}%", "%#{search3}%", "%#{search3}%")
 end
    
end

