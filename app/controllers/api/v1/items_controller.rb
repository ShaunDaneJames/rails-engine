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
    item.save
    render json: ItemSerializer.new(item)
  end
end
