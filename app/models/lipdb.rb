class Lipdb < ActiveRecord::Base

    def self.get_w_lip
        return Lipdb.where(wc:"w").all
    end
    
    def  self.get_c_lip
        return Lipdb.where(wc:"c").all
    end
    
    searchable do
      text :name, :brand, :tone, :pro_type, :wc
    end
end
