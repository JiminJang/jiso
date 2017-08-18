class ReviewcomsController < ApplicationController
    before_action :authenticate_user!
    def new
    end
    
    def create
        Reviewcom.create(content: params[:input_comment], post_id: params[:post_id], user_id: current_user.id)
        redirect_to :back 
    end

    def destroy
        reviewcom = Reviewcom.find(params[:comment_id])
        reviewcom.destroy
        authorize_action_for reviewcom
        redirect_to :back
    end
end
