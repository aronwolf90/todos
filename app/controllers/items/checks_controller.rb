class Items::ChecksController < ApplicationController
  def update
    @item = Current.user.items.find(params.expect(:item_id))

    @item.update!(checked: params.require(:item).require(:checked))

    redirect_to @item.list
  end
end
