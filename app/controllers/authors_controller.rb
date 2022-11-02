class AuthorsController < ApplicationController
  #create author in database with parameters from post request
  def create
    @author = Author.new(first_name: params[:author][:first_name], last_name: params[:author][:last_name], homepage: params[:author][:homepage])
    @author.save
    redirect_to root_path, notice: 'Success!'
  end
end
