class HomeController < ApplicationController
  def index
     
  end
  
  def search

  end
  
  
  def layout4
    # 웜톤 립 출력
     if params[:colors] == "w_lips" 
      @list = Lipdb.get_w_lip.paginate(page: params[:page], per_page: 21) 
     end
     # 쿨톤 립 출력
     if params[:colors] == "c_lips" 
      @list = Lipdb.get_c_lip.paginate(page: params[:page], per_page: 21) 
     end

    
  end
  
  def layout4_sha
        # 웜톤 섀도우 출력
     if params[:colors] == "w_eyes"  
      @list = Eyedb.get_w_eye.paginate(page: params[:page], per_page: 21)
     end
          # 쿨톤 섀도우 출력
     if params[:colors] == "c_eyes"  
      @list = Eyedb.get_c_eye.paginate(page: params[:page], per_page: 21)
     end
    
    #검색 기능
   
     
                        
  end
  
  def layout5
     @w_lips_post = Lipdb.find(params[:w_lip_id])
  end
  
  def layout4_test
     # 웜톤 립 출력
     if params[:colors] == "w_lips" 
      @list = Lipdb.get_w_lip 
     end
     # 웜톤 섀도우 출력
     if params[:colors] == "w_eyes"  
      @list = Eyedb.get_w_eye
     end
     # 쿨톤 립 출력
     if params[:colors] == "c_lips" 
      @list = Lipdb.get_c_lip 
     end
     # 쿨톤 섀도우 출력
     if params[:colors] == "c_eyes"  
      @list = Eyedb.get_c_eye
     end
  end
  
  def layout5_test
     @w_lips_post = Lipdb.find(params[:w_lip_id])
  end
 
end

