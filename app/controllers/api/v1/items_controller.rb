class Api::V1::ItemsController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.all)
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end

  def update
    item = Item.find(params[:id])
    item.update({
      name: params[:name],
      description: params[:description],
      unit_price: params[:unit_price]})
    render json: ItemSerializer.new(item)
  end

  def create
    render json: ItemSerializer.new(Item.create(create_params))
  end

  def destroy
    Item.destroy(params[:id])
  end

  private
  def create_params
    params.permit(:name, :description, :unit_price, :merchant_id)
  end
end
