class Request < ActiveRecord::Base
    has_many :request_comments
    has_many :request_replies
end
