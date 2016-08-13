class Eyedb < ActiveRecord::Base
    
    def self.get_w_eye
        return Eyedb.where(wc:"w").all
    end
    
    def  self.get_c_eye
        return Eyedb.where(wc:"c").all
    end
    
    searchable do
     text :name, :brand, :tone, :pro_type, :wc
    end
    
end
