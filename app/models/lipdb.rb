class Lipdb < ActiveRecord::Base

    def self.get_w_lip
        return Lipdb.where(wc:"w").all
    end
    
    def  self.get_c_lip
        return Lipdb.where(wc:"c").all
    end
     
end
