class ReviewsController < ApplicationController
     before_action :authenticate_user!
     load_and_authorize_resource

    def index
        # @tippostslike=Tippost.all.order("upcount desc").take(3)
        #  @tipposts = Tippost.paginate(:page => params[:page], :per_page => 5)
        # 별 랭킹 순위
        
        @reviews = Review.paginate(:page => params[:page])
        @user_email = ""
        unless session[:user_id].nil? 
        @user_email = User.find(session[:user_id]).email
        end
        
    end
   
    def show
        @reviews = Review.find(params[:id])
        @reviewcoms = Reviewcom.where(post_id: params[:id])
    end
    
    def new
    end
    
    def create
       Review.create(user_id: current_user.id,
            title: params[:title], content: params[:content], image: params[:pic], star: params[:star] )
        redirect_to '/reviews/index'
    end
    
  
  
    def edit
        @reviews = Review.find(params[:id])
        authorize_action_for @reviews
    end
    
    def update
        post = Review.find(params[:id])
        post.title = params[:title]
        post.content = params[:content]
        post.save
        authorize_action_for post
        redirect_to '/reviews/index'
    end
   
    def destroy
        post = Review.find(params[:id])
        post.destroy
        authorize_action_for post
        redirect_to '/reviews/index'
    end
    
    def raking #별별랭킹
         redirect_to :back
    end
    def like #좋아요기능을 하는 액션
        l=Like.new
        l.user_id=current_user.id
        l.post_id=params[:post_id]
        l.save
        post=Review.find(params[:post_id])
        post.upcount +=1
        if post.save
             redirect_to :back
        end
        
    end
    
      
    def dislike #좋아요 취소
    
        l= Like.where('user_id=? AND post_id=?', current_user.id, params[:post_id])
        #뒤에 있는게 물음표 안에 들어가는 거. sql문이다.
        post=Review.find(params[:post_id])
        post.upcount -=1
        post.save
    
        Like.delete(l.first.id) # 괄호 안에 들어가는 건 어떤걸 지울 지 결정하는 거. 첫번째 찾아진 행을 지우는 것.
        
        
        redirect_to :back
        
    end
       

    
end