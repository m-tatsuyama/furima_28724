class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  private

  def item_params
    params.require(:item).permit(:name, :image, :text, :category, :item_status, :charge, :location, :shipping, :price)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
