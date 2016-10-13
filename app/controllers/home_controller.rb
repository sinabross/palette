class HomeController < ApplicationController

  def index

    #공지사항 최신글 보여주기
    @news = Notice.order('id desc').first(1)

    #총 제품 개수
    @product_count = Lipdb.count
    #이번주 등록 제품 개수
    @update_count = Lipdb.where(:id => 200..236).count
  end




  def main
    # 웜 립 TOP3
    @w_best_lip = Lipdb.get_w_lip.order('zzim desc').first(3)
    # 웜 섀도 TOP3
    @w_best_sha = Eyedb.get_w_eye.order('zzim desc').first(3)
    # 쿨 립 TOP3
    @c_best_lip = Lipdb.get_c_lip.order('zzim desc').first(3)
    # 쿨 섀도 TOP3
    @c_best_sha = Eyedb.get_c_eye.order('zzim desc').first(3)
     
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
    # 1-2. searching from Eyedb  (당분간 봉인)
  #  if params[:search]
   #   @result2 = Eyedb.all.search(@search,@search2,@search3).order("zzim DESC").paginate(page: params[:page], per_page: 21)
   # else
    #  @result2 = Eyedb.all.order("zzim desc").paginate(page: params[:page], per_page: 21)
    #end
    
  end
  
  
  def list_lip
    
    # 웜톤 립 출력
    if params[:colors] == "w_lips"
      #웜립일때
      @colors = "w_lips"
      @color_tone = "웜"      
      @liplist = params[:liplist]
      @liptone = params[:liptone]
      #웝립/제품군/세부톤
      @list = Lipdb.get_w_lip.where(tone:params[:liptone]).order('zzim desc').paginate(page: params[:page], per_page: 21)
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
      @color_tone = "쿨"      
      @liplist = params[:liplist]
      @liptone = params[:liptone]
      @list = Lipdb.get_c_lip.where(tone:params[:liptone]).order('zzim desc').paginate(page: params[:page], per_page: 21)
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


  def list_eye
   
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
  
  def detail
    
    #립 상세페이지
    if params[:product_num].start_with?("L")
      @product = Lipdb.find_by_num(params[:product_num])
    end
     
    #섀도우 상세페이지
    if params[:product_num].start_with?("S")
      @product = Eyedb.find_by_num(params[:product_num])
    end
    
   # 좋아요 페이지 (like.js.erb)로 갔다가 redirect 됐을때 좋아요 수를 lip,eye db의 zzim에 저장
   # @product.zzim = @product.votes_for.up.by_type(User).size
   # @product.save
    
    # 리뷰 작성 시에 해당 제품의 리뷰 페이지로 연결될 수 있도록 변수 지정
    @review=Review.where(num:params[:product_num])
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
  
    @product.zzim = @product.votes_for.up.by_type(User).size #좋아요 수를 lip,eye db의 zzim에 저장
    @product.save
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
    @product.zzim = @product.votes_for.up.by_type(User).size #좋아요 수를 lip,eye db의 zzim에 저장
    @product.save
    respond_to do |format|
        # format.html { redirect_to :back }
      format.js 
    end
  end
  # ============== 좋아요 기능 컨트롤러 끝
  
  
  # =============== 후기 관련
  def write_review #리뷰를쓰는페이지
    
    #립
    if params[:product_num].start_with?("L")
      @product = Lipdb.find_by_num(params[:product_num])
    end
     
    #섀도우
    if params[:product_num].start_with?("S")
      @product = Eyedb.find_by_num(params[:product_num])
    end
  end
  
  def review_submit #리뷰를등록
   
   @review = Review.new
   @review.num = params[:pro_submit]
   @review.content = params[:content]
   @review.username = current_user.username
   @review.userseason = current_user.userseason
  
   uploader = LightUploader.new
   uploader.store!(params[:pic])
   @review.img_url=uploader.url
   @review.save

   redirect_to '/home/detail/' + @review.num
  end
  
  def update_view #리뷰를수정하는페이지
    #립
    if params[:product_num].start_with?("L")
      @product = Lipdb.find_by_num(params[:product_num])
    end
     
    #섀도우
    if params[:product_num].start_with?("S")
      @product = Eyedb.find_by_num(params[:product_num])
    end
   
    #리뷰
    @one_review=Review.find(params[:review_id])
  end
  
  def review_edit #수정한리뷰를 등록
    @one_review=Review.find(params[:review_id])
    @one_review.content = params[:content]
    #사진업로드
    if params[:pic] != nil
      uploader = LightUploader.new
      uploader.store!(params[:pic])
      @one_review.img_url = uploader.url
    end
   
    @one_review.save
    redirect_to '/home/detail/' + @one_review.num
  end
  
  def destroy #리뷰삭제
    @one_review=Review.find(params[:review_id])
    @one_review.destroy
    redirect_to :back

  end
  
  # =============== 후기 관련끝
  
  # =============== 문의글 관련
  def feedback #문의글 작성페이지
    #립
    if params[:product_num].start_with?("L")
      @product = Lipdb.find_by_num(params[:product_num])

    #섀도우
    elsif params[:product_num].start_with?("S")
      @product = Eyedb.find_by_num(params[:product_num])
    end
   
  end
  
  def feedback_submit #문의글 전송

    @post=Feedback.new
    @post.title=params[:title]
    @post.content=params[:content]
    @post.emailaddress=params[:email]
    uploader = LightUploader.new
    uploader.store!(params[:pic])
    @post.img_url=uploader.url
    @post.pro_num=params[:feed_pro_num]

    if @post.save
      flash[:success] = "작성이 완료되었습니다 :)"
    end


   
   redirect_to '/home/detail/' + @post.pro_num
    
  end
  
  def show_feedback
   @post=Feedback.all.reverse
   @product = Lipdb.find_by_num(params[:@post.pro_num])
  end
  # =============== 문의글 관련끝
  
  #제품 등록 요청
  def askfor
  
  end
  
  def askfor_submit



    @post=Feedback.new
    @post.content=params[:content]
    @post.emailaddress=params[:email]
    @post.pro_num=params[:feed_pro_num]
    uploader = LightUploader.new
    uploader.store!(params[:pic])
    @post.img_url=uploader.url
    
    if @post.save
      flash[:success] = "작성이 완료되었습니다 :)"
    end

     redirect_to :back
  end
  # My page
  def basket
    @like_list = current_user.find_liked_items
  end
  
  def basket_delete
    # 개별 제품 삭제
    if params[:list_num]
     
      if params[:list_num].start_with?("L")
        @delete_item = Lipdb.find_by_num(params[:list_num])
      else if params[:list_num].start_with?("S")
        @delete_item = Eyedb.find_by_num(params[:list_num])
        end
      end
      
      @delete_item.unliked_by current_user
      @delete_item.zzim = @delete_item.votes_for.up.by_type(User).size
      @delete_item.save
    end 
    redirect_to "/home/basket"
  end
  
  def userseason_update
    @user = current_user
    @user.userseason = params[:optradio]
    @user.save
  
    redirect_to "/basket"
  end
  
  #=============== admin page
  
  def admin_reply #admin 댓글모아보기
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
    if user_signed_in? && current_user.admin?
      @review= Review.all.order("created_at DESC")
    elsif user_signed_in? && current_user.admin==nil
      redirect_to "/"
      flash[:error] = "접근권한이 없습니다."
    end
  end
  
  def admin_user
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
    if user_signed_in? && current_user.admin?
      @user= User.all.order("created_at DESC")
    elsif user_signed_in? && current_user.admin==nil
      redirect_to "/"
      flash[:error] = "접근권한이 없습니다."
    end
  end

  def admin_write   #관리자 계정으로 공지등록

  end

  def notice_edit   #관리자 계정으로 공지글 수정

    @edit=Notice.find(params[:notice_id])

  end

  def notice_edit_back

    @edit=Notice.find(params[:notice_id])
    @edit.title = params[:title]
    @edit.name = params[:name]
    @edit.content = params[:content]
    @edit.save

    redirect_to '/home/notice'
  end

  def notice_delete #공지글 삭제
    @notices=Notice.find(params[:notice_id])
    @notices.destroy
    redirect_to :back
  end
  
  
  #===============
  
  def about
    
  end

  def notice  #제품 업데이트 등 공지사항 알리기 위한 게시판
    @notices = Notice.all.order('id desc')
  end

  def notice_write

    @notices = Notice.new
    @notices.title = params[:title]
    @notices.content = params[:content]
    @notices.name = params[:name]
    @notices.save


    redirect_to "/home/notice"
  end

  def notice_view
    @one_notice = Notice.find(params[:notice_id])

  end


end
