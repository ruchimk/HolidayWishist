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
    # url = "https://openapi.etsy.com/v2/taxonomy/categories/#{category_id}/listings/active?method=GET&api_key=mi7mse8bmftparcsqwsyassi&fields=title,url&limit=100&includes=MainImage"
    response = HTTParty.get(url)
    # images = HTTParty.get("https://openapi.etsy.com/v2/listings/#{@item.etsy_id}/images?api_key=mi7mse8bmftparcsqwsyassi")
    @found_products = response['results']
    # @images = images['results']
  end

end
