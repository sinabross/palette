class Notice < ActiveRecord::Base

  has_many :impressions, :as=>:impressionable
 # is_impressionable :counter_cache => true

  acts_as_punchable #for gem 'punching_bag'

 def impression_count
    impressions.size
  end

  def unique_impression_count
    impressions.group(:ip_address).length #UNTESTED: might not be correct syntax
  end


end
