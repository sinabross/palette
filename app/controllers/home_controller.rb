class HomeController < ApplicationController
  def index
     
  end
  
  def search
     
     if params[:search]
        @list = Lipdb.search(params[:search]).order("created_at DESC") && Eyedb.search(params[:search]).order("created_at DESC")
        
      else
        @list = Lipdb.all.order('created_at DESC') && Eyedb.all.order('created_at DESC')
       
     end
        
  end
  
  
  def layout4
    
    # 웜톤 립 출력
    
     if params[:colors] == "w_lips"
      #웜립일때
      @colors = "w_lips"
      @liplist = params[:liplist]
      @liptone = params[:liptone]
      #웝립/제품군/세부톤
      @list = Lipdb.get_w_lip.where(pro_type:params[:liplist]).where(tone:params[:liptone]).paginate(page: params[:page], per_page: 21)
      #세부톤 선택안했을때
      if params[:liptone] == nil
       @liptone = "세부톤"
       #웜립/제품군에 따라 출력
       @list = Lipdb.get_w_lip.where(pro_type:params[:liplist]).paginate(page: params[:page], per_page: 21)
        #세부톤,제품군 선택안했을때 웜립 전체출력
        if params[:liplist] == nil 
         @liplist = "제품"
         @list = Lipdb.get_w_lip.paginate(page: params[:page], per_page: 21)
        end
       end
    end

     # 쿨톤 립 출력
     if params[:colors] == "c_lips"
      @colors = "c_lips"
      @liplist = params[:liplist]
      @liptone = params[:liptone]
      @list = Lipdb.get_c_lip.where(pro_type:params[:liplist]).where(tone:params[:liptone]).paginate(page: params[:page], per_page: 21)
       if params[:liptone] == nil
        @liptone = "세부톤"
       @list = Lipdb.get_c_lip.where(pro_type:params[:liplist]).paginate(page: params[:page], per_page: 21)
        if params[:liplist] == nil 
         @liplist = "제품"
         @list = Lipdb.get_c_lip.paginate(page: params[:page], per_page: 21)
        end
       end
      end
    

  end


  def layout4_sha
   
    if params[:colors] == "w_eyes"
     
      @colors = "w_eyes"
      @eyelist = params[:eyelist]
      @eyetone = params[:eyetone]
      @list = Eyedb.get_w_eye.where(pro_type:params[:eyelist]).where(tone:params[:eyetone]).paginate(page: params[:page], per_page: 21)
     
      if params[:eyetone] == nil
       @eyetone = "세부톤"
       
       @list = Eyedb.get_w_eye.where(pro_type:params[:eyelist]).paginate(page: params[:page], per_page: 21)
     
        if params[:eyelist] == nil 
         @eyelist = "제품"
         @list = Eyedb.get_w_eye.paginate(page: params[:page], per_page: 21)
        end
       end
    end

  
     if params[:colors] == "c_eyes"
      @colors = "c_eyes"
      @eyelist = params[:eyelist]
      @eyetone = params[:eyetone]
      @list = Eyedb.get_c_eye.where(pro_type:params[:eyelist]).where(tone:params[:eyetone]).paginate(page: params[:page], per_page: 21)
       if params[:eyetone] == nil
        @eyetone = "세부톤"
        @list = Eyedb.get_c_eye.where(pro_type:params[:eyelist]).paginate(page: params[:page], per_page: 21)
        if params[:eyelist] == nil
         @eyelist = "제품"
         @list = Eyedb.get_c_eye.paginate(page: params[:page], per_page: 21)
        end
       end
      end
    

  end
  
  def layout5
     
     @product = Lipdb.find(params[:product_id])
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
