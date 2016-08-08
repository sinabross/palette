class HomeController < ApplicationController
  def index
     #code for searching lip products
      @lips = Lipdb.all
    if params[:search]
      @lips = Lipdb.search(params[:search]).order("created_at DESC")
    else
      @lips = Lipdb.all.order('created_at DESC')
    end
     #code for serching eye shadow products
       @eyes = Eyedb.all
    if params[:search]
      @eyes = Eyedb.search(params[:search]).order("created_at DESC")
    else
      @eyes = Eyedb.all.order('created_at DESC')
    end
  end
  
  def layout4
    
  end
  
  def layout5
    
      end
  
  def bomi 
    
  end
  
  
 
end
