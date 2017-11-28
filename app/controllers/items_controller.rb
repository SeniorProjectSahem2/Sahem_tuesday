class ItemsController < ApplicationController
  load_and_authorize_resource

  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! , except: [:index]

  skip_authorize_resource :only => [:from_category , :index]
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @categories = Category.all

  end

def from_category
    @selected = Item.where(:category_id => params[:category_id])
    respond_to do |format|
        format.js
    end
end
def all_items
    @items = Item.all
    @categories = Category.all
    respond_to do |format|
        format.js
    end
end
def from_search
  @q = "%#{params[:query]}%"
  @items = Item.where("name LIKE ? or description LIKE ?", @q, @q)
  respond_to do |format|
        format.js
    end
end


  #def authorize
   # if current_user.nil?
    #  redirect_to root_path , alert: "Needs to Login"
    #else
     # if @item && @item.user != current_user
      #  redirect_to root_path, alert: "Not authorized only #{@item.user} has access to this item"
      #end
    #end
#end



  # GET /items/1
  # GET /items/1.json
  def show
    @rentals= Rental.where(:category_id => params[:category_id])
    @ratings = Rating.where(:item_id => params[:id])
    
   
  end

  # GET /items/new
  # GET /items/new
  def new
    @item = current_user.items.build
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
     @item = current_user.items.build(item_params)


    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :size, :weight, :quantity, :daily_price, :weekly_price, :monthly_price, :user_id, :category_id, :image, :image2, :image3)
    end
end





