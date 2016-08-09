class Lipdb < ActiveRecord::Base

    def self.get_w_lip
        return Lipdb.where(wc:"w").where("num LIKE ?", "L%").all
    end
     
end
