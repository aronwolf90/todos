class ListsController < ApplicationController
  before_action :set_breadcrumbs, only: %i[ show new edit update ]
  before_action :set_list, only: %i[ show edit update destroy ]

  # GET /lists or /lists.json
  def index
    @lists = Current.user.lists.order(created_at: :desc)
  end

  # GET /lists/1 or /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists or /lists.json
  def create
    @list = Current.user.lists.new(list_params)

    if @list.save
      flash[:notice] = "List was successfully created."
      render turbo_stream: turbo_stream.refresh(request_id: nil)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    if @list.update(list_params)
      flash[:notice] = "List was successfully updated."
      render turbo_stream: turbo_stream.refresh(request_id: nil)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy!

    redirect_to lists_path, status: :see_other, notice: "List was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = Current.user.lists.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.expect(list: [ :name ])
    end

    def set_breadcrumbs
      @breadcrumbs = [
        { title: "Lists", path: root_path }
      ]
    end
end
