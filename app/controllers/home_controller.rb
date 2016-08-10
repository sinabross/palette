class HomeController < ApplicationController
  def index
    
  end
  
  def write

  end
  
  
  def layout4
     @w_lips = Lipdb.get_w_lip
    
  end
  
  def layout5
    
  end
  
  def layout4_test
     @w_lips = Lipdb.get_w_lip
  end
  
  
 
end
