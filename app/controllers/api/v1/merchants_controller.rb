class Api::V1::MerchantsController < ApplicationController

  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update({name: params[:name]})
    merchant.save
    render json: MerchantSerializer.new(merchant)
  end

  def create
    render json: MerchantSerializer.new(Merchant.create(create_params))
  end

  def destroy
    Merchant.destroy(params[:id])
  end

  private
  def create_params
    params.permit(:name)
  end
end
