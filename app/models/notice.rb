class Notice < ActiveRecord::Base

  has_many :impressions, :as=>:impressionable ,counter_cache: true

  def impression_count
    impressions.size
  end

  def unique_impression_count
    impressions.group(:ip_address).length #UNTESTED: might not be correct syntax
  end


end
