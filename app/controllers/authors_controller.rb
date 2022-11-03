class AuthorsController < ApplicationController
  #create author in database with parameters from post request
  def create
    @author = Author.new(first_name: params[:author][:first_name], last_name: params[:author][:last_name], homepage: params[:author][:homepage])
    if @author.save
      redirect_to root_path, notice: 'Success!'
    else
      render 'new'
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
  params.require(:author).permit(:last_name)
end
