class Lip < ActiveRecord::Base

 #for searching
 def self.search(search, search2, search3)
      where("name LIKE ? OR brand LIKE ? OR season LIKE ? OR pro_type LIKE ? OR keyword LIKE ?",
      "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%").where("name LIKE ? OR brand LIKE ? OR season LIKE ? OR pro_type LIKE ? OR keyword LIKE ?",
      "%#{search2}%", "%#{search2}%", "%#{search2}%", "%#{search2}%", "%#{search2}%").where("name LIKE ? OR brand LIKE ? OR season LIKE ? OR pro_type LIKE ? OR keyword LIKE ?",
      "%#{search3}%", "%#{search3}%", "%#{search3}%", "%#{search3}%", "%#{search3}%")
 end

 #for filtering
 scope :tone, -> (tone) { where season: tone }
 scope :pro_type, -> (pro_type) { where pro_type: pro_type }
 scope :color, -> (color) { where color: color }
 scope :texture, -> (texture) { where texture: texture }
 scope :level, -> (level) { where level: level }


    
end

