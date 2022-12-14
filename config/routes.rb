Rails.application.routes.draw do
 
  
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins
  #deivse, 페북로그인
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'users/registrations' ,:sessions => 'users/sessions'}
  resources :home, only: [:list_lip] #for pagination

  
  root 'home#index' #랜딩페이지 메인
  get 'home/index'


  #get 'home/main'  # BEST 제품 보여주는 layout
  
  get 'home/search'

 # 찜하기 장바구니
  get 'home/basket'
  get '/basket' => 'home#basket'
  post 'home/basket_delete'
  get 'home/:list_num/basket_delete/' => 'home#basket_delete'
  get 'home/season_update'
  get 'season_update' => 'home#season_update'
  post 'home/userseason_update'
  
 #테스트버전(visible for Only ADMIN)
#  get 'home/list_lip'
#  get 'home/list_lip/:tone'  => "home#list_lip"  # 립 리스트에서 카테고리 값 부여
  
  # 립 리스트 페이지
  get 'home/list_lip2'
  get 'home/list_lip2/:tone'  => "home#list_lip2"  # 립 리스트에서 카테고리 값 부여
  
  # get 'home/list_lip/:colors/:liptone' =>'home#list_lip'
  #get 'home/list_eye/:colors'  => "home#list_eye"  # 상품카테고리에서 셰도우 리스트로 이동하게 하는 코드
  
  #get 'home/list_lip/:colors/:liplist' => "home#list_lip" # 립 pro_type 세부 카테고리 분류
  #get 'home/list_eye/:colors/:eyelist' => "home#list_eye" # 쉐도우 pro_type 세부 카테고리 분류


  #get 'home/list_lip/:colors/:liplist/:liptone' => "home#list_lip"# 립 tone 세부 카테고리 분류
  #get 'home/list_eye/:colors/:eyelist/:eyetone' => "home#list_eye"
  
  
  
  
 #리뷰

  get 'home/write_review/:product_num' => 'home#write_review' #리뷰쓰기
  post 'home/review_submit' #리뷰등록
  get 'update_view/:product_num/:review_id' => "home#update_view" #리뷰수정하기
  post 'home/review_update_submit/:review_id' => "home#review_edit" #수정한리뷰등록
  get  'destroy_review/:review_id' => "home#destroy_review" #리뷰삭제
 
  
  
  #admin 페이지
  get '/adminadmin' => 'home#admin_user'
  get 'home/admin_reply' #admin_리뷰모아보기
  get 'home/admin_user' #admin_회원모아보기
  get 'home/admin_write'
  get 'home/admin_feedback'#재검토요청 모아보기
  get 'home/admin_likes' #찜현황 모아보기
   
  #제품 재검토 요청
  get 'home/feedback/:product_num' => "home#feedback"
  post 'home/feedback_submit'
  
 
  #상세페이지
  #1. 립리스트에서 오는 경우 (선택한 톤이 있을 경우)
  get 'home/detail2/:tone/:product_num' => "home#detail2"
  #2. 딱히 없을 경우
  get 'home/detail2/:product_num' => "home#detail2"
  
  #진단 히스토리
  post 'home/update_history'
  
  #ask for new products
  #get 'home/askfor'
  post 'home/askfor_submit'  #문의/건의
  post 'home/askfor_submit2' #제품요청

  get 'askfor_delete/:askfor_id' => 'home#askfor_delete' # 제품요청 삭제
  post 'askfor_status/:askfor_id' => 'home#askfor_status' # 제품요청 상태 변경


  #새로 생긴 문의/건의/요청 게시판
  #get 'home/askfor'
  #post 'home/askfor_submit'
  get 'home/request_list'
  get 'home/request_write'
  post 'home/request_write_ok'
  get 'home/request_view/:request_id' => 'home#request_view'
  get 'home/request_destroy/:request_id' => 'home#request_destroy'
  get 'home/request_update/:request_id' => 'home#request_update'
  post 'home/request_update_ok/:request_id' => 'home#request_update_ok'

  post 'home/comment_create'
  get 'home/comment_destroy/:comment_id' => 'home#comment_destroy'
  get 'home/comment_update/:comment_id' => 'home#comment_update'
  
  get 'home/request_reply/:request_id' => 'home#request_reply'
  post 'home/request_reply_ok'
  get 'home/request_reply_view/:request_id' => 'home#request_reply_view'
  get 'home/request_reply_destroy/:request_id' => 'home#request_reply_destroy'
  get 'home/request_reply_update/:request_id' => 'home#request_reply_update'
  post 'home/request_reply_update_ok/:request_id' => 'home#request_reply_update_ok'
  
  get 'home/request_pwd_check/:request_id&current_page=:current_page' => 'home#request_pwd_check'
  post 'home/request_pwd_confirm/:request_id&current_page=:current_page' => 'home#request_pwd_confirm'
  get 'home/request_reply_pwd_check/:request_id' => 'home#request_reply_pwd_check'
  post 'home/request_reply_pwd_confirm/:request_id' => 'home#request_reply_pwd_confirm'

  # 공지사항 게시판

  get 'home/notice'
  post 'home/notice_write'
  get 'home/notice_view/:notice_id' => 'home#notice_view'

  # 공지 글 수정
  get 'home/notice_edit/:notice_id' => 'home#notice_edit'
  post 'home/notice_edit_back/:notice_id' => 'home#notice_edit_back'

  # 공지 글 삭제

  get 'home/notice_delete/:notice_id/' => 'home#notice_delete'


  # 구매 페이지

  #get 'home/order/:product_num' => "home#order"
  #post 'home/order_submit'
  #post 'home/order_submit/:order_id' => "home#order_submit"
  #get "home/order_confirm/:order_id" => "home#order_confirm"





  # 찜하기 기능
  resources :home do 
    member do
      get "like"
      get "unlike"
    end
  end

  # 추천/비추천 기능
  resources :home do 
    member do
      get "recommend"
      get "norecommend"
      get "disrecommend"
      get "nodisrecommend"
      get "recommend2"
      get "norecommend2"
      get "disrecommend2"
      get "nodisrecommend2"
    end
  end


  
  resources :home do 
    member do
      get "basket_delete"
      
    end










  end

 
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
