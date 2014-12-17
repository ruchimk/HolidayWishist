class EtsyAccessoriesController < ApplicationController

  def search_results
    # Get an item: https://openapi.etsy.com/v2/listings/active?api_key=mi7mse8bmftparcsqwsyassi
    @search_terms = params[:q].gsub(" ", "+")
    response_hash = HTTParty.get("https://openapi.etsy.com/v2/listings/active?api_key=mi7mse8bmftparcsqwsyassi&category=accessories")
    @search_results = response_hash["Category"]["Accessories"]
  end

  def create
    @item = Item.new
    @item[:title] = params["item"]["title"]
    @item[:description] = params["item"]["description"]
    @item[:imageURL] = params["item"]["imageURL"]
    @item[:url] = params["item"]["url"]
    @item[:user_id] = params["item"]["description"]
    @item[:is_private] = params["item"]["is_private"]
    @item.save
    redirect_to _path(@user)
  end

def index
  @i


  # var EtsyData = []

  # function getEtsyData() {
  #   // var baseUrl = "https://openapi.etsy.com/v2/listings/active?api_key=mi7mse8bmftparcsqwsyassi&category=accessories"

  #  $.ajax({
  #   url:'/api_call',
  #   type: 'GET',
  #   dataType: "json",
  #   success: function(data) {
  #      console.log(data);
  #         EtsyData = data.results
  #       }
  #   })
  # }

  # $(document).ready(function(){
  #   // console.log("???");
  #   getEtsyData();
  # });
