class Lipdb < ActiveRecord::Base

     def self.search(search)
      where("name LIKE ?", "%#{search}%") 
      where("brand LIKE ?", "%#{search}%")
    end

end
