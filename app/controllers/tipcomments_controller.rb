class TipcommentsController < ApplicationController
    before_action :authenticate_user!
    def new
    end
    
    def create
        Tipcomment.create(content: params[:input_comment], post_id: params[:post_id], user_id: current_user.id)
        redirect_to :back 
    end

    def destroy
        tipcomment = Tipcomment.find(params[:comment_id])
        tipcomment.destroy
        authorize_action_for tipcomment
        redirect_to :back
    end
end
