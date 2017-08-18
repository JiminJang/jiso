class ComcomsController < ApplicationController
    before_action :authenticate_user!
    def new
    end
    
    def create
        Comcom.create(user_id: current_user.id, content: params[:input_comment], post_id: params[:post_id])
       
        redirect_to :back
    end

    def destroy
        comcom = Comcom.find(params[:comment_id])
        comcom.destroy
        authorize_action_for comcom
        redirect_to :back
    end
end
