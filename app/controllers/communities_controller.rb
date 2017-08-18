class CommunitiesController < ApplicationController
        before_action :authenticate_user!
        load_and_authorize_resource
    def index
        # reset_session
        @communitieslike=Community.all.order("upcount desc").take(3)
        @communities=Community.paginate(:page => params[:page])
        if params[:search]
            @communities=Community.search(params[:search]).order("created_at DESC").paginate(:page => params[:page])
        else
            @communities = Community.all.order("id desc").paginate(:page => params[:page])
        end
        unless session[:user_id].nil?
        @user_email = User.find(session[:user_id]).email
        
         
        end
    end
    
    def show
        @communities = Community.find(params[:id])
        @comcoms = Comcom.where(post_id: params[:id])
    end
    
    def new
        
        #authorize! :write, Post
    end  
    
    def create
        
        Community.create(title: params[:title], content: params[:content], image: params[:image], user_id: current_user.id)
        
        redirect_to '/communities/index'
    end
    
    def edit
        @communities= Community.find(params[:id])
        authorize_action_for @communities
    end
    
    def update
        post = Community.find(params[:id])
        post.title= params[:title]
        post.content = params[:content]
        post.image= params[:image]
        post.save
        authorize_action_for post
        redirect_to '/communities/index'
    end
   
    def destroy
        post = Community.find(params[:id])
        post.destroy
        authorize_action_for post
        redirect_to '/communities/index'
    end

    def like #좋아요기능을 하는 액션
        l=Like.new
        l.user_id=current_user.id
        l.post_id=params[:post_id]
        l.save
        post=Community.find(params[:post_id])
        post.upcount +=1
        if post.save
             redirect_to :back
        end
        
    end
    
      
    def dislike #좋아요 취소
    
        l= Like.where('user_id=? AND post_id=?', current_user.id, params[:post_id])
        #뒤에 있는게 물음표 안에 들어가는 거. sql문이다.
        post=Community.find(params[:post_id])
        post.upcount -=1
        Like.delete(l.first.id) # 괄호 안에 들어가는 건 어떤걸 지울 지 결정하는 거. 첫번째 찾아진 행을 지우는 것.
        
        if post.save
            redirect_to :back
        end
        
    end
       
  
end