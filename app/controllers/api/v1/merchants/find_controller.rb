class Api::V1::Merchants::FindController < ApplicationController

  def show
    render json: MerchantSerializer.new(
      Merchant.where("lower(name) LIKE ?", "%" + params[:name].downcase + "%").first)
  end

  def index
    render json: MerchantSerializer.new(
      Merchant.where("lower(name) LIKE ?", "%" + params[:name].downcase + "%"))
  end
end
