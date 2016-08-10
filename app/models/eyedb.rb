class Eyedb < ActiveRecord::Base
    
    def self.get_w_eye
        return Eyedb.where(wc:"w").all
    end
    
    def  self.get_c_eye
        return Eyedb.where(wc:"c").all
    end
     
    
end
