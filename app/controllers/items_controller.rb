class ItemsController < ApplicationController
  before_action :set_breadcrumbs
  before_action :set_list, only: %i[ new create ]
  before_action :set_item, only: %i[ show edit update destroy ]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = @list.items.new(item_params)

    if @item.save
      redirect_to @list, notice: "Item was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item.list, notice: !params["no_flash"] && "Item was successfully updated."
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
      @list = List.find(params.expect(:list_id))
    end

    def set_item
      @item = Item.find(params.expect(:id))
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
