class Api::V1::Merchants::SearchController < ApplicationController

  def index
    merchant = Merchant.find(params[:id])
    render json: ItemSerializer.new(merchant.items)
    # merchant.items.each do |item|
    #   render json: ItemSerializer.new(item)
    # end
  end
end
