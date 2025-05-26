class ItemsController < ApplicationController
  before_action :set_breadcrumbs
  before_action :set_list, only: %i[ new create ]
  before_action :set_item, only: %i[ edit update destroy ]

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = @list.items.new(item_params)

    if @item.save
      flash[:notice] = "Item was successfully created."
      resume_or_redirect_to @list
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      flash[:notice] = params["no_flash"] ? nil : "Item was successfully updated."
      resume_or_redirect_to @item.list
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy!

    redirect_to list_path(@item.list), status: :see_other, notice: "Item was successfully destroyed."
  end

  private
    def set_list
      @list = Current.user.lists.find(params.expect(:list_id))
    end

    def set_item
      @item = Current.user.items.find(params.expect(:id))
    end

    def item_params
      params.expect(item: [ :name, :checked ])
    end

    def set_breadcrumbs
      @breadcrumbs = [
        { title: "Lists", path: root_path }
      ]
    end
end
