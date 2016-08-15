class Lipdb < ActiveRecord::Base

    def self.get_w_lip
        return Lipdb.where(wc:"w").all
    end
    
    def  self.get_c_lip
        return Lipdb.where(wc:"c").all
    end
    
    def self.search(search)
      where("name LIKE ? OR brand LIKE ? OR wc LIKE ? OR pro_type LIKE ? OR tone LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end
   

end
