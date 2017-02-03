class Review < ActiveRecord::Base
    belongs_to :lipdb
    belongs_to :eyedb
    belongs_to :user
    
end
