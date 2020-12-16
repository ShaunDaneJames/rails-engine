class Api::V1::MerchantsController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

  def update
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
    merchant = Merchant.find(params[:id])
    merchant.update({name: params[:name]})
    merchant.save
  end
end
