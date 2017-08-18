class UsersController < ApplicationController
    def change
     
        @brands = Brand.find(params[:id])
        @user=User.find(@brands.user_id)
        authorize! :change, @user
        @user.add_role :alba
        @user.save
        redirect_to '/brands/index'
        

        
    end
end
