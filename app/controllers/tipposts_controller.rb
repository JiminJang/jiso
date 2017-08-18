class TippostsController < ApplicationController
     before_action :authenticate_user!
     load_and_authorize_resource

    def index
        @tippostslike=Tippost.all.order("upcount desc").take(3)

        @tipposts=Tippost.paginate(:page => params[:page])
        if params[:search]
            @tipposts=Tippost.search(params[:search]).order("created_at DESC").paginate(:page => params[:page])
        else
            @tipposts = Tippost.all.order("id desc").paginate(:page => params[:page])
        end
        @user_email = ""
        unless session[:user_id].nil? 
        @user_email = User.find(session[:user_id]).email
        end
        
        @category= Category.all

    end
    
    def category
        
        @category = Category.find(params[:id])
        @tipposts = Tippost.where(category_id: params[:id]) 
        

        
    end
    
   
    def show
        @tippost = Tippost.find(params[:id])
        @tipcomments = Tipcomment.where(post_id: params[:id])
        @category= Tippost.find(params[:id]).category
        
        
    end
    
    def new
        @tippost = Tippost.new
        authorize! :create, @tippost

    end
    
    def create
        @tippost = Tippost.new(tippost_params, user_id: current_user.id)
        @tippost.user_id = current_user.id
        @tippost.save
 

         if @tippost.save

        redirect_to '/tipposts/index'
     else
         flash[:danger] = @tippost.errors.full_messages.to_sentence
        render 'new'
     end
        # Tippost.create(user_id: current_user.id,
        #     title: params[:title], content: params[:content], image: params[:pic]  )
        # redirect_to '/tipposts/index'
    end
    
   
  
  
    def edit
        @tippost = Tippost.find(params[:id])
        authorize_action_for @tippost
    end
    
    def update
        post = Tippost.find(params[:id])
        post.title = params[:title]
        post.content = params[:content]
        post.save
        authorize_action_for post
        redirect_to '/tipposts/index'
    end
   
    def destroy
        post = Tippost.find(params[:id])
        post.destroy
        authorize_action_for post
        redirect_to '/tipposts/index'
    end
    
    def like #좋아요기능을 하는 액션
    l=Like.new
    l.user_id=current_user.id
    l.post_id=params[:post_id]
    l.save
    post=Tippost.find(params[:post_id])
    post.upcount +=1
    if post.save
         redirect_to :back
    end
    
    end
    
      
    def dislike #좋아요 취소
    
        l= Like.where('user_id=? AND post_id=?', current_user.id, params[:post_id])
        #뒤에 있는게 물음표 안에 들어가는 거. sql문이다.
        post=Tippost.find(params[:post_id])
        post.upcount -=1
        post.save
    
        Like.delete(l.first.id) # 괄호 안에 들어가는 건 어떤걸 지울 지 결정하는 거. 첫번째 찾아진 행을 지우는 것.
        
        
        redirect_to :back
        
    end
       
  

      private
        def tippost_params
            params.require(:tippost).permit(:title, :content, :image, :user_id, :category_id)
            
        end    
end
