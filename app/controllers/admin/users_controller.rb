class Admin::UsersController < ApplicationController
	 layout "admin"
   before_filter :authenticate_user!
   def index
   	 page = params[:page] || 1
   	 @users = User.paginate :page => page, :order => 'created_at DESC'
			respond_to do |format|
				format.html # index.html.erb
				format.xml  { render :xml => @users }
			end  
   end
   
   def show	
    	@user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(admin_users_url) }
      format.xml  { head :ok }
    end
  end
end
