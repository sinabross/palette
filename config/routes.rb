Rails.application.routes.draw do
  
  resources :home, only: [:layout4]
  root 'home#index'
  get 'home/index'
  
  
  get 'home/layout4/:colors'  => "home#layout4"  # 상품카테고리에서 상품리스트로 이동하게 하는 코드
  get 'home/layout4_test/:colors' => "home#layout4_test"  # 상품카테고리에서 상품리스트로 이동하게 하는 코드
  
  
  #layout5 뒤에 오는 값들을 w.id 라는 비둘기에 담아서 home#layout5_test에 전달하겠다.
  get 'home/layout5/:w_lip_id' => "home#layout5"
  get 'home/layout5_test/:w_lip_id' => "home#layout5_test"
  
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
