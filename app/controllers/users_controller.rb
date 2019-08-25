class UsersController < ApplicationController
 before_action :authenticate_user!


  def index
  	# @profile_images = @user.profile_images.page(params[:page]).reverse_order
  	@user = current_user

    @book = Book.new
    
    @users = User.all
  end

  def show

  	@user = User.find(params[:id])



    @book = Book.new

    @books =  @user.books

  end

  def edit
  	@user = User.find(params[:id])
  if @user.id != current_user.id
      redirect_to user_path(current_user)
      flash[:notice] = "error"

end  	 

  end



  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
    flash[:notice] = "error"
    redirect_to user_path
      
    end
  end




private 
def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
end

end
