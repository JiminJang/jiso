class AlbacomsController < ApplicationController
    before_action :authenticate_user!
    def new
    end
    
    def create
        Albacom.create(user_id: current_user.id, content:  params[:input_comment], post_id: params[:post_id])
       
        redirect_to :back
    end

    def destroy
        albacom = Albacom.find(params[:comment_id])
        albacom.destroy
        authorize_action_for albacom
        redirect_to :back
    end
end
