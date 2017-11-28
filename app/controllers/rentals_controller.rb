class RentalsController < ApplicationController

  load_and_authorize_resource

  before_action :set_rental, only: [:show, :edit, :update, :destroy]
  skip_authorize_resource :only => :acceptance_msg
  # GET /rentals 
  # GET /rentals.json
  def index
    @rentals = current_user.Rental_request
  end
def change_to_accept
    @rental = Rental.find params[:rental_id]
    @rental.update_column(:status, "accepted") 
    Notification.create(recipient: @rental.user, actor: current_user, action: "accepted", notifiable: @rental)
    Transaction.create(item_name: @rental.item.name, borrower: @rental.user, lender: @rental.item.user,  item: @rental.item, rental: @rental, start_date: @rental.start_date, end_date: @rental.end_date)
    redirect_to rental_acceptance_msg_path
  end
  # GET /rentals/1
  # GET /rentals/1.json
  def show
    @rentals = current_user.Rental_request
  end

# GET /rentals/1
  # GET /rentals/1.json
  def acceptance_msg
  end

  # GET /rentals/new
  def new
    if user_signed_in?
    @rental = current_user.rentals.build
     @rental.item = Item.find(params[:item_id])
     @ratings = Rating.where(item_id: params[:item_id])
   else
     redirect_to user_session_url
   end
  end

  # GET /rentals/1/edit
  def edit
    authorize! :update , @rental

  end

  # POST /rentals
  # POST /rentals.json
  def create
    @rental = Rental.new(rental_params)
    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
        # Create the notifications
        Notification.create(recipient: @rental.item.user, actor: current_user, action: "requested", notifiable: @rental)
      
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentals/1
  # PATCH/PUT /rentals/1.json
  def update
    authorize! :update , @rental
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to @rental, notice: 'Rental was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentals/1
  # DELETE /rentals/1.json
  def destroy
    authorize! :destroy , @rental
    if @rental.user != current_user
      Notification.create(recipient: @rental.user, actor: current_user, action: "declined", notifiable: @rental.item)
      @rental.destroy
      respond_to do |format|
        format.html { redirect_to rentals_url }
        format.json { head :no_content }
      end
  else
    notification = Notification.where(notifiable: @rental)
    notification[0].destroy
    @rental.destroy
    redirect_to @rental.item
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
      params.require(:rental).permit(:item_id, :user_id, :start_date, :end_date , :quantity, :comment)
    end
end