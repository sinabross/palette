Rails.application.routes.draw do
  
  resources :home, only: [:layout4] #for pagination
  
  devise_for :users
  
  root 'home#index'
  get 'home/index'
  get 'home/index2'
  
  
  get 'home/search'

  get 'home/basket'
  get '/basket' => 'home#basket'
  get 'home/basket_delete/:list_num' => 'home#basket_delete'
  get 'home/season_update'
  get 'season_update' => 'home#season_update'
  post 'home/userseason_update'
  
  
  
  
  
  get 'home/basket_test'

  get 'home/layout4/:colors'  => "home#layout4"  # 상품카테고리에서 립 리스트로 이동하게 하는 코드
  get 'home/layout4_sha/:colors'  => "home#layout4_sha"  # 상품카테고리에서 셰도우 리스트로 이동하게 하는 코드
  
  get 'home/layout4/:colors/:liplist' => "home#layout4" # 립 pro_type 세부 카테고리 분류
  get 'home/layout4_sha/:colors/:eyelist' => "home#layout4_sha" # 쉐도우 pro_type 세부 카테고리 분류
  
  get 'home/layout4/:colors/:liplist/:liptone' => "home#layout4"# 립 tone 세부 카테고리 분류 
  get 'home/layout4_sha/:colors/:eyelist/:eyetone' => "home#layout4_sha"
  
  get 'home/write_review' # 리뷰쓰기
  
  #layout5 뒤에 오는 값들을 w.id 라는 비둘기에 담아서 home#layout5_test에 전달하겠다.
  get 'home/layout5/:product_num' => "home#layout5"
 
  # 좋아요 기능
  resources :home do 
    member do
      get "like"
      get "unlike"
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
