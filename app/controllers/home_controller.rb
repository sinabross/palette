class HomeController < ApplicationController
  def index
     
  end
  
  def search
     
     # 립 제품 검색결과
       if params[:search]
         @result = Lipdb.all.search(params[:search]).order("id DESC")
       else
         @result = Lipdb.all.order("zzim desc")
       end
     # 섀도우 제품 검색결과  
       if params[:search]
         @result2 = Eyedb.all.search(params[:search]).order("id DESC")
       else
         @result2 = Eyedb.all.order("zzim desc")
       end
  end
  
  
  def layout4
    
    # 웜톤 립 출력
     if params[:colors] == "w_lips" 
      @list = Lipdb.get_w_lip.paginate(page: params[:page], per_page: 21) 
     end
     
    # if params[:colors] == "w_lipstick"
   #   @list = Lipdb.get_w_lip.where(pro_type:"lipstick").paginate(page: params[:page], per_page: 21)  
    # end
   #  if params[:colors] == "w_liptint"
   ##   @list = Lipdb.get_w_lip.where(pro_type:"liptint").paginate(page: params[:page], per_page: 21)  
   #  end     
  #  if params[:colors] == "w_lipgloss"
   #   @list = Lipdb.get_w_lip.where(pro_type:"lipgloss/liplacquer").paginate(page: params[:page], per_page: 21)  
  #   end
     
     # 쿨톤 립 출력
     if params[:colors] == "c_lips" 
      @list = Lipdb.get_c_lip.paginate(page: params[:page], per_page: 21) 
     end 
   #  if params[:colors] == "c_lipstick"
    #  @list = Lipdb.get_c_lip.where(pro_type:"lipstick").paginate(page: params[:page], per_page: 21)  
     #end
  #   if params[:colors] == "c_liptint"
   #   @list = Lipdb.get_c_lip.where(pro_type:"liptint").paginate(page: params[:page], per_page: 21)  
    # end     
     #if params[:colors] == "c_lipgloss"
    #  @list = Lipdb.get_c_lip.where(pro_type:"lipgloss/liplacquer").paginate(page: params[:page], per_page: 21)  
     #end

  end


  def layout4_sha
     # 웜톤 섀도우 출력
     if params[:colors] == "w_eyes"  
      @list = Eyedb.get_w_eye.paginate(page: params[:page], per_page: 21)
     end
     # 웜톤 섀도우 제품 종류에 따른 출력
   #  if params[:colors] == "w_eyescake"  
    #  @list = Eyedb.get_w_eye.where(pro_type:"cake").paginate(page: params[:page], per_page: 21)
  #   end
  #   if params[:colors] == "w_eyespencil"  
  #    @list = Eyedb.get_w_eye.where(pro_type:"pencil").paginate(page: params[:page], per_page: 21)
  #   end
     
     # 쿨톤 섀도우 출력
     if params[:colors] == "c_eyes"  
      @list = Eyedb.get_c_eye.paginate(page: params[:page], per_page: 21)
     end
     
     # 쿨톤 섀도우 제품의 종류에 따른 출력
 #    if params[:colors] == "c_eyescake"  
  #    @list = Eyedb.get_c_eye.where(pro_type:"cake").paginate(page: params[:page], per_page: 21)
  #   end
 #    if params[:colors] == "c_eyespencil"  
 #     @list = Eyedb.get_c_eye.where(pro_type:"pencil").paginate(page: params[:page], per_page: 21)
  #   end
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
