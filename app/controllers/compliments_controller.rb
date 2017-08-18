class ComplimentsController < ApplicationController
     before_action :authenticate_user!
    def index
        @compliments = Compliment.paginate(:page => params[:page]).order("id desc")
    end
    
    def create
        Compliment.create(user_id: current_user.id, title: params[:title], content: params[:content])
        
        redirect_to '/compliments/index'
    end
    
   
    def destroy
        compliment = Compliment.find(params[:id])
        compliment.destroy
        authorize_action_for compliment
        redirect_to '/compliments/index'
    end
end
