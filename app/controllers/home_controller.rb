require 'rails_autolink'
class HomeController < ApplicationController

  include ApplicationHelper
  
  def index

    #공지사항 최신글 보여주기
    @news = Notice.order('id desc').first(5)

    #총 제품 개수
    @product_count = Lip.count


    #이번주 등록 제품 개수

    #@update_count = Lipdb.where(:id => 200..236).count
    #@update_count = 0

    #제품 요청
    #@asks = Askfor.order('id desc').paginate(page: params[:page], per_page: 5)


  end

# main은 에전에 BEST 제품 노출하던 layout

#  def main
#    # 웜 립 TOP3
#    @w_best_lip = Lipdb.get_w_lip.order('zzim desc').first(3)
#    # 웜 섀도 TOP3
#    @w_best_sha = Eyedb.get_w_eye.order('zzim desc').first(3)
#    # 쿨 립 TOP3
#    @c_best_lip = Lipdb.get_c_lip.order('zzim desc').first(3)
#    # 쿨 섀도 TOP3
#    @c_best_sha = Eyedb.get_c_eye.order('zzim desc').first(3)

#  end
  

  def search
    # splitting the search key word
    if params[:search].include?(" ") == true
      @search = params[:search].split(" ").first
      @search2 = params[:search].split(" ").second
      @search3 = params[:search].split(" ").third
    else
      @search = params[:search]
    end   

    if params[:search]
      @result = Lip.all.search(@search,@search2,@search3).order("brand").paginate(page: params[:page], per_page: 21)
    else
      @result = Lip.all.order("brand").paginate(page: params[:page], per_page: 21)
    end
    
    if params[:tone]
      @current_season = params[:tone]
    else
      @current_season = "default"
    end

  end
  
  
  def list_lip


  #빵부스러기 목록
  if params[:tone]
    @current_season = params[:tone]
    @list = Lipdb.where(season_total: params[:tone]).order('brand').paginate(page: params[:page], per_page: 21)
  else
    @current_season = "봄 브라이트"
  end
  
  
  # 8 분류에 따른 립 카테고리 설정
#  if params[:tone]
#    @list=Lipdb.where(season_total: params[:tone]).order('brand').paginate(page: params[:page], per_page: 21)

#    @list=Lipdb.where(season_total: params[:tone])
#    .where(color: params[:color]).where(texture: params[:texture])
#    .where(brand: params[:brand]).order('brand').paginate(page: params[:page], per_page: 21)
# end


  
#  if params[:tone] || params[:texture] 
  
#   @list=Lipdb.where(season_total: params[:tone]).where(texture: params[:texture]).order('brand').paginate(page: params[:page], per_page: 21)
   ## @list=Lipdb.where(season_total: params[:tone])
    ##.where(texture: params[:texture]).where("brand LIKE ?","%#{params[:brand]}%").order('brand').paginate(page: params[:page], per_page: 21)
#  end
  


  # 12분류 기준일때는 봉인 (16.11.08)

    # 웜톤 립 출력
 #   if params[:colors] == "w_lips"
      #웜립일때
 #     @colors = "w_lips"
 #     @color_tone = "웜"
     # @liplist = params[:liplist]
 #     @liptone ||= params[:liptone]
      #웝립/제품군/세부톤
 #     @list = Lipdb.get_w_lip.where(tone:params[:liptone]).order('brand').paginate(page: params[:page], per_page: 21)
   # if params[:liplist] == nil
    #   @liplist = "제품"
     #  @list = Lipdb.get_w_lip.where(tone:params[:liptone]).order('brand').paginate(page: params[:page], per_page: 21)
  #    if params[:liptone] == nil
  #        @liptone = "세부톤 전체보기"
  #        @list = Lipdb.get_w_lip.order('brand').paginate(page: params[:page], per_page: 21)
  #    end
  #   end
      #세부톤 선택안했을때
  #   if params[:liptone] == nil
  #      @liptone = "세부톤"
        #웜립/제품군에 따라 출력
  #      @list = Lipdb.get_w_lip.where(pro_type:params[:liplist]).order('brand').paginate(page: params[:page], per_page: 21)
         #세부톤,제품군 선택안했을때 웜립 전체출력
  #      if params[:liplist] == nil
  #        @liplist = "제품"
  #        @list = Lipdb.get_w_lip.order('brand').paginate(page: params[:page], per_page: 21)
  #      end
  #    end
  #  end

  #  # 쿨톤 립 출력
  #  if params[:colors] == "c_lips"
  #    @colors = "c_lips"
  #    @color_tone = "쿨"
    #  @liplist = params[:liplist]
  #    @liptone = params[:liptone]
  #    @list = Lipdb.get_c_lip.where(tone:params[:liptone]).order('brand').paginate(page: params[:page], per_page: 21)
    #  if params[:liplist] == nil
    #    @liplist = "제품"
    #    @list = Lipdb.get_c_lip.where(tone:params[:liptone]).order('brand').paginate(page: params[:page], per_page: 21)
  #      if params[:liptone] == nil
  #        @liptone = "세부톤 전체보기"
  #        @list = Lipdb.get_c_lip.order('brand').paginate(page: params[:page], per_page: 21)
  #      end
  #  end

   #   if params[:liptone] == nil
   #     @liptone = "세부톤"
   #     @list = Lipdb.get_c_lip.where(pro_type:params[:liplist]).order('brand').paginate(page: params[:page], per_page: 21)
   #     if params[:liplist] == nil
   #       @liplist = "제품"
   #       @list = Lipdb.get_c_lip.order('brand').paginate(page: params[:page], per_page: 21)
   #     end
   #   end
   # end

  end
  
  def list_lip2

    #립 리스트 제목
    if params[:tone]
      @current_season = params[:tone]
    else
      @current_season = "봄 브라이트"
    end
    
    
    #계절 톤을 구성하는 세부톤 알려주기
  
    @tone_detail = case @current_season
    
      when "봄 브라이트" then "브라이트, 비비드"
      when "봄 라이트" then "페일, 라이트"
      when "여름 라이트" then "페일, 라이트"  
      when "여름 뮤트" then "라이트 그레이시, 소프트, 그레이시, 덜"  
      when "가을 뮤트" then "라이트 그레이시, 소프트, 그레이시, 덜"   
      when "가을 딥" then "스트롱, 딥, 다크, 다크 그레이시"
      when "겨울 딥" then "딥, 다크, 다크 그레이시"
      when "겨울 브라이트" then "브라이트, 비비드, 스트롱"
    
    end
            
    

    #lip.rb에 있는 메소드 사용

    #필터 검색

    @list = Lip.where(nil).order('brand').paginate(page: params[:page], per_page: 21) # creates an anonymous scope

    @list = @list.tone(params[:tone]).order('brand').paginate(page: params[:page], per_page: 21) if params[:tone].present?

    @list = @list.pro_type(params[:pro_type]).order('brand').paginate(page: params[:page], per_page: 21) if params[:pro_type].present?

    @list = @list.color(params[:color]).order('brand').paginate(page: params[:page], per_page: 21)if params[:color].present?

   # @list = @list.texture(params[:texture]).order('brand').paginate(page: params[:page], per_page: 21) if params[:texture].present?

    @list = @list.level(params[:level]).order('brand').paginate(page: params[:page], per_page: 21) if params[:level].present?

    #브랜드 필터(드롭박스) 검색
    
    if params[:brand].present?
      
    @list = @list.brand(params[:brand]).order('brand').paginate(page: params[:page], per_page: 21) 
    
    @list = @list.brand(params[:brand]).tone(params[:tone]).order('brand').paginate(page: params[:page], per_page: 21) if params[:tone].present?
    
    @list = @list.brand(params[:brand]).pro_type(params[:pro_type]).order('brand').paginate(page: params[:page], per_page: 21) if params[:pro_type].present?
    
    @list = @list.brand(params[:brand]).color(params[:color]).order('brand').paginate(page: params[:page], per_page: 21) if params[:color].present?
    
    @list = @list.brand(params[:brand]).level(params[:level]).order('brand').paginate(page: params[:page], per_page: 21) if params[:level].present?

    end
    


  end


  def detail
    
    #립 상세페이지
    if params[:product_num].start_with?("L")
      @product = Lipdb.find_by_image(params[:product_num])
    end

    
   # 좋아요 페이지 (like.js.erb)로 갔다가 redirect 됐을때 좋아요 수를 lip,eye db의 zzim에 저장
   # @product.zzim = @product.votes_for.up.by_type(User).size
   # @product.save
    
    # 리뷰 작성 시에 해당 제품의 리뷰 페이지로 연결될 수 있도록 변수 지정
    @review=Review.where(num:params[:product_num])



  end

  def detail2
    
    # 빵부스러기
    #if params[:product_num]
    #  @current_season = Lip.find_by_image(params[:product_num])
    #else
    #  @current_season = "봄 브라이트"
    #end
    
    #립 상세페이지
    if params[:product_num]
      @product = Lip.find_by_image(params[:product_num])
    end

    if params[:tone]
      @current_season = params[:tone]
    else
      @current_season = "default"
    end

    # 좋아요 페이지 (like.js.erb)로 갔다가 redirect 됐을때 좋아요 수를 lip,eye db의 zzim에 저장
     #@product.zzim = @product.votes_for.up.by_type(User).size
     #@product.save
    
    #추천수1
    @recommend_count = @product.get_likes(:vote_scope => 'recommend').size
    #비추천수1
    @disrecommend_count = @product.get_dislikes(:vote_scope => 'recommend').size
    
     #추천수2
    @recommend2_count = @product.get_likes(:vote_scope => 'recommend2').size
    #비추천수2
    @disrecommend2_count = @product.get_dislikes(:vote_scope => 'recommend2').size
    
    
    # 리뷰 작성 시에 해당 제품의 리뷰 페이지로 연결될 수 있도록 변수 지정
    @review=Review.where(num:params[:product_num]).order("id desc").paginate(page: params[:page], per_page: 5)
    


  end  
  #================= 아래는 좋아요 기능=====================
  def like 
    
    if params[:id].start_with?("L") 
      @product = Lip.find_by_image(params[:id])   #find_by_image 에서 image는 제품 데이터의 고유의 값(현재는 L006이런게 엑셀 상 image 열에 있어서 image임)
    end
    
    @product.liked_by current_user, :duplicate => true #찜하기의 총 누적 흔적 세기 위해서 duplicate 옵션 추가
  
    #@product.zzim = @product.votes_for.up.by_type(User).size #좋아요 수를 lip,eye db의 zzim에 저장
    #@product.save
    
    
      
    respond_to do |format|
      #format.html { redirect_to :back }
      format.js
    end
  end  

  def unlike
    
    if params[:id].start_with?("L") 
      @product = Lip.find_by_image(params[:id])
    end
    
    #@product.unliked_by current_user
     @product.downvote_from current_user,:duplicate => true #찜하기의 총 누적 흔적 세기 위해서 duplicate 옵션 추가
    #@product.zzim = @product.votes_for.up.by_type(User).size #좋아요 수를 lip,eye db의 zzim에 저장
    #@product.save
    
   
    
    respond_to do |format|
        # format.html { redirect_to :back }
      format.js 
    end
  end
  # ============== 좋아요 기능 컨트롤러 끝=====================
  
  #==================================추천/비추천
  
  # 추천/비추천 첫번째 톤
  # 추천
  def recommend
    @product = Lip.find_by_image(params[:id])
    @product.liked_by current_user, :vote_scope => 'recommend', :duplicate => true 

    respond_to do |format|
      format.js 
    end
  end
  # 추천 취소
  def norecommend
     @product = Lip.find_by_image(params[:id])
     @product.unliked_by current_user, :vote_scope => 'recommend' #기존 추천표 취소
     
      respond_to do |format|
       format.js 
      end
  end
  #비추천
  def disrecommend
    
    @product = Lip.find_by_image(params[:id])
    @product.disliked_by current_user, :vote_scope => 'recommend', :duplicate => true


     respond_to do |format|
      format.js 
     end
  end
  #비추천 취소
  def nodisrecommend
     @product = Lip.find_by_image(params[:id])
     @product.undisliked_by current_user, :vote_scope => 'recommend' # 기존의 추천표 취소
     
      respond_to do |format|
       format.js 
      end
  end
  
  
  # 추천/비추천 두번째 톤
  #  추천
  def recommend2
    @product = Lip.find_by_image(params[:id])
    @product.liked_by current_user, :vote_scope => 'recommend2', :duplicate => true 

    respond_to do |format|
      format.js 
    end
  end
  # 추천 취소
  def norecommend2
     @product = Lip.find_by_image(params[:id])
     @product.unliked_by current_user, :vote_scope => 'recommend2' #기존 추천표 취소
     
      respond_to do |format|
       format.js 
      end
  end
  #비추천
  def disrecommend2
    
    @product = Lip.find_by_image(params[:id])
    @product.disliked_by current_user, :vote_scope => 'recommend2', :duplicate => true


     respond_to do |format|
      format.js 
     end
  end
  #비추천 취소
  def nodisrecommend2
     @product = Lip.find_by_image(params[:id])
     @product.undisliked_by current_user, :vote_scope => 'recommend2' # 기존의 추천표 취소
     
      respond_to do |format|
       format.js 
      end
  end
  
   #==================================추천/비추천 끝
  
  
  # =============== 후기 관련==================================
  def write_review #리뷰를쓰는페이지
    
    #립
    if params[:product_num].start_with?("L")
      @product = Lip.find_by_image(params[:product_num])
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

   redirect_to '/home/detail2/' + @review.num
  end
  
  def update_view #리뷰를수정하는페이지
    #립
    if params[:product_num].start_with?("L")
      @product = Lip.find_by_image(params[:product_num])
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
    redirect_to '/home/detail2/' + @one_review.num
  end
  
  def destroy_review #리뷰삭제
    @one_review=Review.find(params[:review_id])
    @one_review.destroy
    redirect_to :back

  end
  
  # =============== 후기 관련끝===========================
  
  # =============== 문의글 관련============================
  def feedback #문의글 작성페이지
    #립
    if params[:product_num].start_with?("L")
      @product = Lip.find_by_image(params[:product_num])
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

      redirect_to '/home/detail2/' + @post.pro_num

    end


    
  end
  

#제품 등록 요청
  def askfor
    
     #제품요청
      if Askfor != nil
        @askfor = Askfor.all.order("id desc").paginate(page: params[:page], per_page: 5)
      end
      @askforCnt = @askfor.count unless @askfor.blank?
      @askforCnt = 0 if @askfor.blank?
    
  end
  

  def askfor_submit
    
   
    #제품요청
    @askfor= Askfor.new
    @askfor.brand = params[:brand]
    @askfor.name = params[:name]
    @askfor.username = current_user.username
    @askfor.save

    redirect_to "/home/askfor"
   
  end


  



  def askfor_delete #제품 요청 삭제
    @one_askfor=Feedback.find(params[:askfor_id])
    @one_askfor.destroy
    redirect_to :back
  end
  # =============== 문의글 관련끝====================
  
  
  # =============== 새로 생긴 문의/건의 게시판 시작 ===============
  def request_list
    
    
    #문의/건의
    #@requests = Request.find(:all, :limit =>rowsPerPage, :order=>'created_at desc')
    @requests = Request.all.order("id desc").first(5)
    @replies = RequestReply.all.order("id asc")
    
    @current_page2 = params[:current_page] ? params["current_page"] : 1    #현재 페이지
    @totalCnt = Request.all.count                                         #전체 게시글 수
    @totalPageList = getTotalPageList(@totalCnt, rowsPerPage)             #전체 페이지 리스트
    
    @requestList = Request.find_by_sql ["select * from REQUESTS ORDER BY id desc limit %s offset %s",
            rowsPerPage, @current_page2.to_i == 1 ? 0 : 5*(@current_page2.to_i-1) ]
    
    @prev_page2 = @current_page2.to_i - 1                                   #이전 페이지
    @next_page2 = @current_page2.to_i + 1                                   #다음 페이지
    @total_page2 = getTotalPageList(@totalCnt, rowsPerPage).size           #전체 페이지 수
    
  end
  
  def request_write_ok
  
    @request = Request.new
    @request.title = params[:title]
    @request.content = params[:content]
    @request.nickname = current_user.username
    @request.group = @request.id
    @request.level = 0
    @request.secret = params[:secret]
    @request.password = params[:password]
    
    uploader = RequestUploader.new
    uploader.store!(params[:pic])
    @request.img_url=uploader.url
    
    @request.save

  
    redirect_to "/home/request_list"
  end
  
  def request_pwd_check
    @one_request = Request.find(params[:request_id])
    @current_page = params[:current_page]
  end
  
  def request_pwd_confirm
    @one_request = Request.find(params[:request_id])
    @current_page = params[:current_page]
    
    if @one_request.password? && @one_request.password == params[:pwd_confirm]
      redirect_to "/home/request_view/" + params[:request_id] + "&current_page=" + params[:current_page]
    else
      redirect_to "/home/request_pwd_check/" + params[:request_id] + "&current_page=" + params[:current_page]
      flash[:error]="비밀번호를 확인해주세요."
    end
  end
  
  def request_view
    @one_request = Request.find(params[:request_id])
    
    unless user_signed_in? && current_user.admin == true
      @one_request.punch(request)
    end
    
    @last_view_id= Request.order("created_at").last.id
    @first_view_id=Request.order("created_at").first.id

    unless @first_view_id == @one_request.id
      @prev_view_id = Request.where("created_at < ?", @one_request.created_at).last.id
      @request_prev = Request.find(@prev_view_id)
    end

    unless @last_view_id == @one_request.id
      @next_view_id = Request.where("created_at > ?", @one_request.created_at).first.id
      @request_next = Request.find(@next_view_id)
    end
    
  end
  
  def request_destroy
    @one_request = Request.find(params[:request_id])
    @one_request.destroy
    
    redirect_to "/home/request_list"
  end

  def request_update
    @one_request = Request.find(params[:request_id])
  end
  
  def request_update_ok
    @one_request = Request.find(params[:request_id])
    @one_request.title = params[:title]
    @one_request.content = params[:content]
    @one_request.nickname = current_user.username
    
    #사진업로드
    if params[:pic] != nil
      uploader = RequestUploader.new
      uploader.store!(params[:pic])
      @one_request.img_url = uploader.url
    end
    
    @one_request.save
    
    redirect_to "/home/request_view/" + params[:request_id]
  end
  
  
  ##########댓글##########
  def comment_create
    @comment_create = RequestComment.new
    @comment_create.content = params[:content]
    @comment_create.nickname = current_user.username
    @comment_create.request_id = params[:request_id]
    @comment_create.save
    
    redirect_to :back
  end
  
  def comment_destroy
    @one_comment = RequestComment.find(params[:comment_id])
    @one_comment.destroy
    
    redirect_to :back
  end
  
  def comment_update
    @one_comment = RequestComment.find(params[:comment_id])
  end


  ##########답글##########
  def request_reply
    @one_request = Request.find(params[:request_id])
    @group = @one_request.id
    @level = 1
  end
  
  def request_reply_ok
    @request_reply_ok = RequestReply.new
    @request_reply_ok.title = params[:title]
    @request_reply_ok.content = params[:content]
    
    @request_reply_ok.nickname = current_user.username
    @request_reply_ok.request_id = params[:request_id]
    @request_reply_ok.group = params[:reply_group]
    @request_reply_ok.level = params[:reply_level]

    
    @request_reply_ok.save
    
    redirect_to "/home/request_list"
  end
  
  def request_reply_pwd_check
    @one_reply = RequestReply.find_by_request_id(params[:request_id])
    @one_request = Request.find(params[:request_id])
  end
  
  def request_reply_pwd_confirm
    @one_reply = RequestReply.find_by_request_id(params[:request_id])
    @one_request = Request.find(params[:request_id])
    
    if @one_request.password? && @one_request.password == params[:pwd_confirm]
      redirect_to "/home/request_reply_view/" + params[:request_id]
    else
      redirect_to "/home/request_reply_pwd_check/" + params[:request_id] 
      flash[:error]="비밀번호를 확인해주세요."
    end
  end
  
  def request_reply_view
    @one_reply = RequestReply.find_by_request_id(params[:request_id])
    
    unless user_signed_in? && current_user.admin == true
      @one_reply.punch(request)
    end
    
  end

  def request_reply_destroy
    @one_reply = RequestReply.find_by_request_id(params[:request_id])
    @one_reply.destroy
    
    redirect_to "/home/request_list"
  end
  
  def request_reply_update
    @one_reply = RequestReply.find_by_request_id(params[:request_id])
  end
  
  def request_reply_update_ok
    @one_reply = RequestReply.find_by_request_id(params[:request_id])
    @one_reply.title = params[:title]
    @one_reply.content = params[:content]
    @one_reply.nickname = current_user.username
    @one_reply.save
    
    redirect_to "/home/request_reply_view/" + params[:request_id]
  end

  # =============== 새로 생긴 문의/건의 게시판 끝 =================
  
  
 # =============  My page =====================

  # My page
  def basket
    
    
    #@like_list = current_user.find_liked_items  #이것도 current_user 찜목록인데 pagination이 안되서 아래걸로 함
    @like_list=current_user.get_up_voted Lip.paginate(page: params[:page], per_page:15)
    
    
  end
  
  def basket_delete
    # 개별 제품 삭제
    if params[:list_num]
     
      if params[:list_num].start_with?("L")
        @delete_item = Lip.find_by_image(params[:list_num])
     # else if params[:list_num].start_with?("S")
     #   @delete_item = Eyedb.find_by_num(params[:list_num])

      end
      
      @delete_item.unliked_by current_user
     # @delete_item.zzim = @delete_item.votes_for.up.by_type(User).size
     # @delete_item.save
    end
    redirect_to "/home/basket"
  end
  
  def userseason_update
    @user = current_user
    @user.userseason = params[:optradio]
    @user.save
  
    redirect_to "/basket"
  end

  # ================== My page end ======================


  #=============== admin page============================
  
  def admin_reply #admin 리뷰모아보기
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
    if user_signed_in? && current_user.admin?
      @review= Review.all.order("created_at DESC").paginate(page: params[:page], per_page: 5)
    elsif user_signed_in? && current_user.admin==nil
       redirect_to "/"
      flash[:error] = "접근권한이 없습니다."
    end
  
  #  @asks = Askfor.order('id desc').paginate(page: params[:page], per_page: 5)
  
  end
  
  def admin_user
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
    
    if user_signed_in? && current_user.admin?
      @user= User.all.order("created_at DESC").paginate(page: params[:page], per_page: 30)
    elsif user_signed_in? && current_user.admin==nil
      redirect_to "/"
      flash[:error] = "접근권한이 없습니다."
    end
    
    
  end
  
  def admin_likes  # 찜 현황판 보기
   #@list = Lip.all.paginate(page: params[:page], per_page: 15)
   
   #act as votable의 migration을 통해 Lip talbe에 cached 데이터들을 넣었을 경우 
   @like_list=Lip.where("cached_votes_total > ?", 0).order(:cached_votes_up => :desc).paginate(page: params[:page], per_page:15)
   @liked_items_count=@like_list.count  
   #수동으로 만든 all_likes 테이블을 사용할 경우
   
   #총 좋아요 수
  # @all_likes_total = AllLike.group('product_num').sum('likes') #결과값으로 hash 도출 
  # @current_likes_total = AllLike.where.not(hates:1).group('product_num').sum('likes') #결과값으로 hash 도출
  # @like_list = Lip.all.paginate(page: params[:page], per_page:15)
  
   
   #@like_list=Lip.joins(:all_likes).order("sum_sweetness ASC").paginate(page: params[:page], per_page:15)
  
  
    if params[:tone]
      @current_season = params[:tone]
    else
      @current_season = "default"
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
    redirect_to '/home/notice'
  end

  def askfor_status #제품 요청 상태 수정
    @one_askfor = Askfor.find(params[:askfor_id])
    @one_askfor.status = params[:status]
    @one_askfor.save

    redirect_to :back
  end
  
  def admin_feedback #admin 재검토요청 모아보기
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
    if user_signed_in? && current_user.admin?
      @review= Feedback.all.order("created_at DESC").paginate(page: params[:page], per_page: 5)
    elsif user_signed_in? && current_user.admin==nil
       redirect_to "/"
      flash[:error] = "접근권한이 없습니다."
    end
  
  #  @asks = Askfor.order('id desc').paginate(page: params[:page], per_page: 5)
  
  end
  #=============== admin page =================
  

  # ==================새소식 ==========================

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

    unless user_signed_in? && current_user.admin == true
    @one_notice.punch(request)
    end


    @last_view_id= Notice.order("created_at").last.id
    @first_view_id=Notice.order("created_at").first.id

    unless @first_view_id == @one_notice.id
      @pre_view_id = Notice.where("id < ?", params[:notice_id]).last.id
      @notice_previous = Notice.find(@pre_view_id)
    end

    unless @last_view_id == @one_notice.id
      @next_view_id = Notice.where("id > ?", params[:notice_id]).first.id
      @notice_next = Notice.find(@next_view_id)
    end

  end
 # ========================새소식 끝 ================


 #=======================구매 페이지=====================

  def order
    @product = Lip.find_by_image(params[:product_num])
  end

  def order_submit
    if params[:order_id]
      @order_check = Order.find(params[:order_id])
      @order_check.confirm = params[:confirm]
      @order_check.save

      redirect_to "/"


    else
      @new_order = Order.new
      @new_order.name = params[:name]
      @new_order.tel = params[:tel]
      @new_order.address = params[:address]
      @new_order.money_name = params[:money_name]
      @new_order.product_brand = params[:product_brand]
      @new_order.product_name = params[:product_name]
      @new_order.product_price = params[:product_price]
      @new_order.save

        redirect_to "/home/order_confirm/#{@new_order.id}"
    end


  end

  def order_confirm
      @product_order = Order.find(params[:order_id])
      @total_price = @product_order.product_price * @product_order.product_number
  end






 #=======================/구매 페이지 끝=====================




end
