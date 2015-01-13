#etsy search controller
class SearchesController < ApplicationController

  def new
    #new search should show all the listings of all categories
    url = "https://openapi.etsy.com/v2/taxonomy/categories?api_key=mi7mse8bmftparcsqwsyassi"
    response = HTTParty.get(url)
    categories = JSON.parse(response.body)
    @cat_list = categories["results"]
    render "new"
  end

  def index
    url = "https://openapi.etsy.com/v2/taxonomy/categories?api_key=mi7mse8bmftparcsqwsyassi"
    response = HTTParty.get(url)
    categories = JSON.parse(response.body)
    @cat_list = categories["results"]

    category = params['name']
    @category = category
    listing_url = "https://openapi.etsy.com/v2/private/listings/active?sort_on=created&sort_order=down&category=#{category}&api_key=mi7mse8bmftparcsqwsyassi&includes=MainImage&limit=100"
    listing_response = HTTParty.get(listing_url)
    @found_products = listing_response['results']
  end

end
