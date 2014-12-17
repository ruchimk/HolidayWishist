
# require 'rubygems'
# require 'json'
# require 'net/http'
# require 'httparty'

#etsy search controller
class SearchesController < ApplicationController

  include HTTParty
  respond_to :json

  def index
    # Get an item: https://openapi.etsy.com/v2/listings/active?api_key=mi7mse8bmftparcsqwsyassi
    #show all the listings of all categories
    @searches = current_user.searches.all
    categories = HTTParty.get("https:///openapi.etsy.com/v2/taxonomy/categories?api_key=#{etsy_key}/")
    @cat_list = categories["results"]
    # respond_to do |format|
    #   format.json { render :json => JSON.parse(@result) }
    #   format.html { render "index.html.erb" }
  end

  def show
    @search = Search.find(params[:id])
  end


  def create
    @search = current_user.searches.build(search_params) #auto assigns this to the user
    if @search.save
      redirect_to :back, notice: "Item added."
    else
      redirect_to :back, alert: "Failed to save."
    end
  end

  private

  def search_params
    params.require(:search).permit(:title, :description, :image_url, :url, :is_private)
  end


end
