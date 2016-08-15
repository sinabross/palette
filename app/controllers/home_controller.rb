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
  
     #립 상세페이지
     if params[:product_num].start_with?("L")
      @product = Lipdb.find_by_num(params[:product_num])
     end
     
     #섀도우 상세페이지
     if params[:product_num].start_with?("S")
      @product = Eyedb.find_by_num(params[:product_num])
     end
      
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
