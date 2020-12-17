class Api::V1::Items::FindController < ApplicationController

  def show
    render json: ItemSerializer.new(
      Item.where("lower(name) LIKE ?", "%" + params[:name].downcase + "%").first)
  end

  def index
    render json: ItemSerializer.new(
      Item.where("lower(name) LIKE ?", "%" + params[:name].downcase + "%")) 
  end
end
