class Review < ActiveRecord::Base
    belongs_to :lip
    belongs_to :user
    
end
