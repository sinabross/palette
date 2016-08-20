class LikesController < ApplicationController

def upvote 
  @lipdb = Lipdb.find(params[:id])
  @eyedb = Eyedb.find(params[:id])
  @lipdb.upvote_by current_user
  @eyedb.upvote_by current_user
  
  redirect_to :back
end  

def downvote
  @lipdb = Lipdb.find(params[:id])
  @eyedb = Eyedb.find(params[:id])
  @lipdb.downvote_by current_user
  @eyedb.downvote_by current_user
  
  redirect_to :back
end

end
