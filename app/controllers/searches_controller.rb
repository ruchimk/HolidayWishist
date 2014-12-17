#etsy search controller
class SearchesController < ApplicationController

  def new
    # Get an item: https://openapi.etsy.com/v2/listings/active?api_key=mi7mse8bmftparcsqwsyassi
    #new search should show all the listings of all categories
    url = "https://openapi.etsy.com/v2/taxonomy/categories?api_key=mi7mse8bmftparcsqwsyassi"
    response = HTTParty.get(url)
    categories = JSON.parse(response.body)
    @cat_list = categories["results"]
    render "new"
  end

  def index
    category_id = params['category_id']
    url = "https://openapi.etsy.com/v2/listings/active?api_key=mi7mse8bmftparcsqwsyassi"

    response = HTTParty.get(url)
    @found_products = response['results']
  end


  def create
    render 'new_item_path'
    # @search = current_user.searches.build(search_params) #auto assigns this to the user
    # if @search.save
    #   redirect_to :back, notice: "Item added."
    # else
    #   redirect_to :back, alert: "Failed to save."
    # end
  end


end
