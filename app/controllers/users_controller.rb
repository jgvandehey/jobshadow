class UsersController < ApplicationController

 # before_filter :load_user, only: [:show, :selfvote]
 # before_filter :redirect_if_no_user, only: [:show]
 # before_filter :authenticate_user!, except: [:index, :show, :browse]

  def show   
    @user = !params[:id].nil? ? User.find(params[:id]) : current_user    
  end

  # def browse
  #   # search is broken locally, to fix locally remove the 'i' in 'iLIKE' but remember to put it back before push to production or search will be case sensitive again
  #   @users = User.order("name").paginate(:per_page => 100, :page => params[:page])
  #   @user = !params[:id].nil? ? User.find(params[:id]) : current_user
    

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @users }

  #     if params[:name]
  #       @users = @users.where("name iLIKE ? OR headline iLIKE ? OR company_0 iLIKE ? OR email iLIKE ? OR title_0 iLIKE ?", 
  #         "%#{params[:name]}%",
  #         "%#{params[:name]}%",
  #         "%#{params[:name]}%",
  #         "%#{params[:name]}%",
  #         "%#{params[:name]}%")
  #     end
  #   end
  # end

  protected

  def load_user  
    @user = !params[:id].nil? ? User.find(params[:id]) : current_user
  end

  def redirect_if_no_user
    redirect_to new_user_session_path if !@user
  end

end