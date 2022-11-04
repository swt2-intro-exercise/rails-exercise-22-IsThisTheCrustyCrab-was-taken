class AuthorsController < ApplicationController
  #create author in database with parameters from post request
  def new
    @author = Author.new
  end
  def edit
    @author = Author.find(params[:id])
  end
  def create
    @author = Author.new(first_name: params[:author][:first_name], last_name: params[:author][:last_name], homepage: params[:author][:homepage])
    if @author.save
      redirect_to root_path, notice: 'Success!'
    else
      render 'new'
    end
  end
  #update author with id
  def update
    @author = Author.find(params[:id])
    puts("found author with id #{params[:id]} and name #{author_params[:first_name]} #{author_params[:last_name]}")
    if @author.update(author_params)
      puts("updated author with id #{params[:id]} and name #{author_params[:first_name]} #{author_params[:last_name]}")
      redirect_to @author
    else
      puts("failed to update author with id #{params[:id]} and name #{author_params[:first_name]} #{author_params[:last_name]}")
      render 'edit'
    end
  end
  #show author with id
  def show
    @author = Author.find(params[:id])
  end
  def index
    @authors = Author.all
  end
end
private def author_params
  params.require(:author).permit(:last_name, :first_name, :homepage)

end
