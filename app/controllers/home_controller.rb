class HomeController < ApplicationController
  
  def index
    # 웜 립 TOP3
     @w_best_lip = Lipdb.get_w_lip.order('zzim desc').first(3)
    # 웜 섀도 TOP3
     @w_best_sha = Eyedb.get_w_eye.order('zzim desc').first(3)
    # 쿨 립 TOP3
     @c_best_lip = Lipdb.get_c_lip.order('zzim desc').first(3)
    # 쿨 섀도 TOP3
     @c_best_sha = Eyedb.get_c_eye.order('zzim desc').first(3)
     
  end
  def index2
     
  end
  
  def search
     
     
     
     # splitting the search key word
     
       if params[:search].include?(" ") == true
         @search = params[:search].split(" ").first
         @search2 = params[:search].split(" ").second
         @search3 = params[:search].split(" ").third
       else
         @search = params[:search]
       end   
       # 1-1. searching from Lipdb
         if params[:search]
           @result = Lipdb.all.search(@search,@search2,@search3).order("zzim DESC").paginate(page: params[:page], per_page: 21)
         else
           @result = Lipdb.all.order("zzim desc").paginate(page: params[:page], per_page: 21)
         end
         
       # 1-2. searching from Eyedb 
         if params[:search]
           @result2 = Eyedb.all.search(@search,@search2,@search3).order("zzim DESC").paginate(page: params[:page], per_page: 21)
         else
           @result2 = Eyedb.all.order("zzim desc").paginate(page: params[:page], per_page: 21)
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
      @list = Lipdb.get_w_lip.where(pro_type:params[:liplist]).where(tone:params[:liptone]).order('zzim desc').paginate(page: params[:page], per_page: 21)
      if params[:liplist] == nil
      @liplist = "제품"
      @list = Lipdb.get_w_lip.where(tone:params[:liptone]).order('zzim desc').paginate(page: params[:page], per_page: 21)
       if params[:liptone] == nil
        @liptone = "세부톤"
        @list = Lipdb.get_w_lip.order('zzim desc').paginate(page: params[:page], per_page: 21) 
       end
      end
      #세부톤 선택안했을때
      if params[:liptone] == nil
       @liptone = "세부톤"
       #웜립/제품군에 따라 출력
       @list = Lipdb.get_w_lip.where(pro_type:params[:liplist]).order('zzim desc').paginate(page: params[:page], per_page: 21)
        #세부톤,제품군 선택안했을때 웜립 전체출력
        if params[:liplist] == nil 
         @liplist = "제품"
         @list = Lipdb.get_w_lip.order('zzim desc').paginate(page: params[:page], per_page: 21)
        end
      end
     end

     # 쿨톤 립 출력
     if params[:colors] == "c_lips"
      @colors = "c_lips"
      @liplist = params[:liplist]
      @liptone = params[:liptone]
      @list = Lipdb.get_c_lip.where(pro_type:params[:liplist]).where(tone:params[:liptone]).order('zzim desc').paginate(page: params[:page], per_page: 21)
      if params[:liplist] == nil
       @liplist = "제품"
       @list = Lipdb.get_c_lip.where(tone:params[:liptone]).order('zzim desc').paginate(page: params[:page], per_page: 21)
       if params[:liptone] == nil
        @liptone = "세부톤"
        @list = Lipdb.get_c_lip.order('zzim desc').paginate(page: params[:page], per_page: 21) 
       end
      end
       if params[:liptone] == nil
        @liptone = "세부톤"
       @list = Lipdb.get_c_lip.where(pro_type:params[:liplist]).order('zzim desc').paginate(page: params[:page], per_page: 21)
        if params[:liplist] == nil 
         @liplist = "제품"
         @list = Lipdb.get_c_lip.order('zzim desc').paginate(page: params[:page], per_page: 21)
        end
       end
     end
    

  end


  def layout4_sha
   
    if params[:colors] == "w_eyes"
     
      @colors = "w_eyes"
      @eyelist = params[:eyelist]
      @eyetone = params[:eyetone]
      @list = Eyedb.get_w_eye.where(pro_type:params[:eyelist]).where(tone:params[:eyetone]).order('zzim desc').paginate(page: params[:page], per_page: 21)
      if params[:eyelist] == nil
       @eyelist = "제품"
       @list = Eyedb.get_w_eye.where(tone:params[:eyetone]).order('zzim desc').paginate(page: params[:page], per_page: 21)
       if params[:eyetone] == nil
        @eyetone = "세부톤"
        @list = Eyedb.get_w_eye.order('zzim desc').paginate(page: params[:page], per_page: 21) 
       end
      end
      if params[:eyetone] == nil
       @eyetone = "세부톤"
       
       @list = Eyedb.get_w_eye.where(pro_type:params[:eyelist]).order('zzim desc').paginate(page: params[:page], per_page: 21)
     
        if params[:eyelist] == nil 
         @eyelist = "제품"
         @list = Eyedb.get_w_eye.order('zzim desc').paginate(page: params[:page], per_page: 21)
        end
      end
    end

  
     if params[:colors] == "c_eyes"
      @colors = "c_eyes"
      @eyelist = params[:eyelist]
      @eyetone = params[:eyetone]
      @list = Eyedb.get_c_eye.where(pro_type:params[:eyelist]).where(tone:params[:eyetone]).order('zzim desc').paginate(page: params[:page], per_page: 21)
      if params[:eyelist] == nil
       @eyelist = "제품"
       @list = Eyedb.get_c_eye.where(tone:params[:eyetone]).order('zzim desc').paginate(page: params[:page], per_page: 21)
       if params[:eyetone] == nil
        @eyetone = "세부톤"
        @list = Eyedb.get_c_eye.order('zzim desc').paginate(page: params[:page], per_page: 21) 
       end
      end
       if params[:eyetone] == nil
        @eyetone = "세부톤"
        @list = Eyedb.get_c_eye.where(pro_type:params[:eyelist]).order('zzim desc').paginate(page: params[:page], per_page: 21)
        if params[:eyelist] == nil
         @eyelist = "제품"
         @list = Eyedb.get_c_eye.order('zzim desc').paginate(page: params[:page], per_page: 21)
        end
       end
     end
    

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
    
     # 좋아요 수를 lip,eye db의 zzim에 저장
     @product.zzim = @product.votes_for.up.by_type(User).size
     @product.save
     
  end
  
  #================= 아래는 좋아요 기능을 위한 노력의 흔적들..........
 
  
  def like 
    
    if params[:id].start_with?("L") 
      @product = Lipdb.find_by_num(params[:id])
    else if params[:id].start_with?("S")
      @product = Eyedb.find_by_num(params[:id])   
    end
    end
    
     
     @product.liked_by current_user
     
      respond_to do |format|
        #format.html { redirect_to :back }
        format.js
        
      end
    
  end  

  def unlike
    
   if params[:id].start_with?("L") 
      @product = Lipdb.find_by_num(params[:id])
   else if params[:id].start_with?("S")
      @product = Eyedb.find_by_num(params[:id])   
   end
   end
    
     @product.unliked_by current_user
      respond_to do |format|
        #format.html { redirect_to :back }
        format.js 
 
      end
    
  # ==============좋아요 기능 컨트롤러 끝   
    
  end
  
  def write_review
   
   
  end
  
  def basket
    
    @like_list = current_user.find_liked_items

  
  end
  def basket_delete
    
 
  end
  def userseason_update
     @user = current_user
     @user.userseason = params[:optradio]
     @user.save
  
     redirect_to "/basket"
  end

end
