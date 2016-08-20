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
      @list = Lipdb.get_w_lip.where(pro_type:params[:liplist]).where(tone:params[:liptone]).paginate(page: params[:page], per_page: 21)
      if params[:liplist] == nil
      @liplist = "제품"
      @list = Lipdb.get_w_lip.where(tone:params[:liptone]).paginate(page: params[:page], per_page: 21)
       if params[:liptone] == nil
        @liptone = "세부톤"
        @list = Lipdb.get_w_lip.paginate(page: params[:page], per_page: 21) 
       end
      end
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
      if params[:liplist] == nil
       @liplist = "제품"
       @list = Lipdb.get_c_lip.where(tone:params[:liptone]).paginate(page: params[:page], per_page: 21)
       if params[:liptone] == nil
        @liptone = "세부톤"
        @list = Lipdb.get_c_lip.paginate(page: params[:page], per_page: 21) 
       end
      end
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
      if params[:eyelist] == nil
       @eyelist = "제품"
       @list = Eyedb.get_w_eye.where(tone:params[:eyetone]).paginate(page: params[:page], per_page: 21)
       if params[:eyetone] == nil
        @eyetone = "세부톤"
        @list = Eyedb.get_w_eye.paginate(page: params[:page], per_page: 21) 
       end
      end
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
      if params[:eyelist] == nil
       @eyelist = "제품"
       @list = Eyedb.get_c_eye.where(tone:params[:eyetone]).paginate(page: params[:page], per_page: 21)
       if params[:eyetone] == nil
        @eyetone = "세부톤"
        @list = Eyedb.get_c_eye.paginate(page: params[:page], per_page: 21) 
       end
      end
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
  
     #립 상세페이지
     if params[:product_num].start_with?("L")
      @product = Lipdb.find_by_num(params[:product_num])
     end
     
     #섀도우 상세페이지
     if params[:product_num].start_with?("S")
      @product = Eyedb.find_by_num(params[:product_num])
     end
  
  end
  
  def upvote 
    
    if params[:id].start_with?("L") 
      @product = Lipdb.find_by_num(params[:id])
    else if params[:id].start_with?("S")
      @product = Eyedb.find_by_num(params[:id])   
    end
    end
    
    @product.upvote_by current_user
    
    redirect_to :back
  end  

  def downvote
    
    @like_product = @product.find(params[:id])
    @like_product.downvote_by current_user
    
    redirect_to :back
  end
  
  def write_review
   
  end
 
end
