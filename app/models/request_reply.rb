class RequestReply < ActiveRecord::Base
    belongs_to :request
    
    has_many :impressions, :as=>:impressionable
    # is_impressionable :counter_cache => true
    
    acts_as_punchable #for gem 'punching_bag'
    
    def impression_count
    impressions.size
    end
    
    def unique_impression_count
    impressions.group(:ip_address).length #UNTESTED: might not be correct syntax
    end
    
    def url_to_external(text)
    /\Ahttp(s)?:\/\//.match(text) ? text : text.gsub(/\A(http(s)?:\/\/)?(www\.)?(.*)/,"http\\2://www.\\4")
    end
    
end
