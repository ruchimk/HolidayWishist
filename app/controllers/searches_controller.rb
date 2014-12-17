#etsy search controller
class SearchesController < ApplicationController

  def new
    @search = Search.new
  end

  def index
    # Get an item: https://openapi.etsy.com/v2/listings/active?api_key=mi7mse8bmftparcsqwsyassi
    #show all the listings of all categories
    url = "https://openapi.etsy.com/v2/taxonomy/categories?api_key=mi7mse8bmftparcsqwsyassi"
    response = HTTParty.get(url)
    categories = JSON.parse(response.body)
    @cat_list = categories["results"]
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


end
