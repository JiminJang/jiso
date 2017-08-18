class HomeController < ApplicationController
    def index
       @tippostslike=Tippost.all.order("upcount desc").take(3)
       @communitieslike=Community.all.order("upcount desc").take(3)
       @albaslike=Alba.all.order("upcount desc").take(3)
       
       

           
        
    end
    def search

        unless params[:search].nil?
        
        @resultalba=Alba.search(params[:search])
        @resulttippost=Tippost.search(params[:search])
        @resultcommunity=Community.search(params[:search])
    

    end
    
    
        
        
    end
    
    
     def mypage
        @myposts = Tippost.where(user_id: current_user.id)
        
    end


    

    
    
    # 로그인 팝업
    def juhyun
        @tipposts = Tippost.all
        @user_email = ""
        unless session[:user_id].nil? 
        @user_email = User.find(session[:user_id]).email
        
        end
    end
end
