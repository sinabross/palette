class HomeController < ApplicationController
  def index
    
  end
  
  def write

  end
  
  
  def layout4
     @w_lips = Lipdb.get_w_lip 
    
  end
  
  def layout5
     @w_lips_post = Lipdb.find(params[:w_lip_id])
  end
  
  def layout4_test
     @w_lips = Lipdb.get_w_lip
  end
  
  def layout5_test
     @w_lips_post = Lipdb.find(params[:w_lip_id])
  end
 
end
