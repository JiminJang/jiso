class BrandsController < ApplicationController
     before_action :authenticate_user!
     #load_and_authorize_resource

    def index

        @brands=Brand.all

    end
    
    def show
        @brands = Brand.find(params[:id])

    end
    
    def new
    end  
    
    def create
        
        Brand.create(title: params[:title], content: params[:content], image: params[:pic], user_id: current_user.id)
        
        redirect_to '/brands/index'
    end
    
    def edit
        @brands= Brand.find(params[:id])
        authorize_action_for @brands
    end
    
    def update
        post = Brand.find(params[:id])
        post.title= params[:title]
        post.content = params[:content]
        post.image=params[:pic]
        post.save
        authorize_action_for post
        redirect_to '/brands/index'
    end
   
    def destroy
        post = Brand.find(params[:id])
        post.destroy
        authorize_action_for post
        redirect_to '/brands/index'
    end
end
