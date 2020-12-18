class Api::V1::Merchants::SoldController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.most_items_sold(params[:quantity]))
  end
end
