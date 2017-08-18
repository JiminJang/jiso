Rails.application.routes.draw do
  devise_for :users
  
  resources :communities, only: [:index]
  resources :tipposts, only: [:index, :new, :category]
  resources :albas, only: [:index]
  resources :home, only: [:search]
  
  root 'home#index'
  get 'home/about'
   get 'users/change/:id'=>'users#change'
  #인증게시판
  get '/brands/show/:id' => 'brands#show'
  get '/brands/new' => 'brands#new'
  post '/brands/create'
  get '/brands/edit/:id' => 'brands#edit'
  post '/brands/update/:id' => 'brands#update'
  post '/brands/destroy/:id' => 'brands#destroy'
  get '/brands/index'

  #팁포스트
  get '/tipposts/show/:id' => 'tipposts#show'
  get '/tipposts/new' => 'tipposts#new'
  post '/tipposts/create'
  get '/tipposts/edit/:id' => 'tipposts#edit'
  post '/tipposts/update/:id' => 'tipposts#update'
  post '/tipposts/destroy/:id' => 'tipposts#destroy'
  get '/tipposts/index'
  
   # 팁포스트 카테고리
   
  get '/tipposts/category/:id' => 'tipposts#category'
  
  #팁댓글
  get '/tipcomments/new'
  post '/tipposts/show/:post_id/tipcomments/create' => 'tipcomments#create'
  post '/tipposts/show/:post_id/tipcomments/destroy/:comment_id' => 'tipcomments#destroy'
  
  # #회원가입
  # get 'users/new'
  # post 'users/create'

  
  # #로그인
  # get 'logins/_new'
  # post 'logins/create'
  # get 'logins/destroy'
  # get 'home/juhyun'
  # get 'tipposts/new'
  
  #좋아요
  post 'likes/like'  
  #좋아요취소
  post 'likes/dislike'
  
  #커뮤니티
  
  get '/communities/new'
  post '/communities/create' => 'communities#create'
  post '/communities/destroy/:id'=>'communities#destroy'
  get '/communities/index' => 'communities#index'
  get '/communities/show/:id'=>'communities#show'
  get '/communities/edit/:id'=>'communities#edit'
  post '/communities/update/:id' => 'communities#update'
  #커뮤니티 댓글
  
  get '/comcoms/new'
  post '/communities/show/:post_id/comcoms/create' => 'comcoms#create'
  post '/communities/show/:post_id/comcoms/destroy/:comment_id' => 'comcoms#destroy'

  
  #알바생게시판
    get '/albas/new'
  post '/albas/create' => 'albas#create'
  post '/albas/destroy/:id'=>'albas#destroy'
  get '/albas/index' => 'albas#index'
  get '/albas/show/:id'=>'albas#show'
  get '/albas/edit/:id'=>'albas#edit'
  post '/albas/update/:id' => 'albas#update'
  
  

  get '/albacoms/new'
  post '/albas/show/:post_id/albacoms/create' => 'albacoms#create'
  post '/albas/show/:post_id/albacoms/destroy/:comment_id' => 'albacoms#destroy'
  
  #리뷰
  get '/reveiws/index' => 'reviews#index'
  get '/reviews/show/:id' => 'reviews#show'
  get '/reviews/new'
  post '/reviews/create' => 'reviews#create'
  get '/reviews/edit/:id' => 'reviews#edit'
  post '/reviews/update/:id' => 'reviews#update'
  post '/reviews/destroy/:id' => 'reviews#destroy'
  get '/reviews/index'
  
  #리뷰댓글
  get '/reviews/new'
  post '/reviews/show/:post_id/reviewcoms/create' => 'reviewcoms#create'
  post '/reviews/show/:post_id/reviewcoms/destroy/:comment_id' => 'reviewcoms#destroy'
  
  #팁댓글
  get '/tipcomments/new'
  post '/tipposts/show/:post_id/tipcomments/create' => 'tipcomments#create'
  post '/tipposts/show/:post_id/tipcomments/destroy/:comment_id' => 'tipcomments#destroy'
  
  #칭찬게시판
  get '/compliments/index'
  post '/compliments/create' => 'compliments#create'
  post '/compliments/destroy/:id' => 'compliments#destroy'
  
  #브랜드
  get '/brands/index'
  
  #마이페이지
  get '/home/mypage'
  
  post '/communities/like'
  post '/communities/dislike'
  post '/albas/like'
  post '/albas/dislike'
  post '/tipposts/like'
  post '/tipposts/dislike'
  post '/reviews/like'
  post '/reviews/dislike'
  
  get '/home/search'=>'home#search'
   
  
  
  

  
end
