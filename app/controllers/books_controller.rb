class BooksController < ApplicationController
 before_action :authenticate_user!


    def top
    	
    	
    end
	def index
	    @book = Book.new

	  	@books = Book.all

	  	@user = current_user
	end


  def create

    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
    flash[:notice] = "You have creatad book successfully."
    redirect_to "/books/#{book.id}"

	else
    flash[:notice] = "error"
		redirect_to books_path
	end
   end

	def show
  	@book2 = Book.find(params[:id])
    @book = Book.new
    @user = User.find(@book2.user_id)

    
	end
  def edit

    @book2 = Book.find(params[:id])
    if @book2.user_id != current_user.id
      redirect_to books_path
      flash[:notice] = "error"
    end
    
  end

  def update
    @book2 = Book.find(params[:id])
    if @book2.update(book_params)
    flash[:notice] = "You have creatad book successfully."
    redirect_to book_path(@book2.id)
  else
    flash[:notice] = "error"
    redirect_to book_path
    end
    
  end
  def destroy
    book2 = Book.find(params[:id])
    book2.destroy
    redirect_to books_path
    
  end

	private
def book_params
    params.require(:book).permit(:title, :body)
end
	
end
