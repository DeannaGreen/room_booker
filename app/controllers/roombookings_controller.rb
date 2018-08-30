class RoombookingsController < ApplicationController
  before_action :set_roombooking, only: [:show, :edit, :update, :destroy]

  # GET /roombookings
  # GET /roombookings.json
  def index
    @roombookings = Roombooking.includes(:room, :user).all
  end

   def mybookings
    @bookings = Roombooking.includes(:room,:user).where("user_id = '?'", current_user.id)
    # .group_by(&:room)
    respond_to do |format|
      format.html
      format.json
    end
    render 'room/bookings'
  end
  
  # GET /roombookings/1
  # GET /roombookings/1.json
  def show
  end

  # GET /roombookings/new
  def new
    @roombooking = Roombooking.new
    @rooms = Room.all
    @users = User.all
  end

  # GET /roombookings/1/edit
  def edit
    @rooms = Room.all
    @users = User.all
  end

  # POST /roombookings
  # POST /roombookings.json
  def create
    @roombooking = Roombooking.new(roombooking_params)
    @rooms = Room.all
    @users = User.all

    respond_to do |format|
      if @roombooking.save
        format.html { redirect_to @roombooking, notice: 'Roombooking was successfully created.' }
        format.json { render :show, status: :created, location: @roombooking }
      else
        format.html { render :new }
        format.json { render json: @roombooking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roombookings/1
  # PATCH/PUT /roombookings/1.json
  def update
    respond_to do |format|
      if @roombooking.update(roombooking_params)
        format.html { redirect_to @roombooking, notice: 'Roombooking was successfully updated.' }
        format.json { render :show, status: :ok, location: @roombooking }
      else
        format.html { render :edit }
        format.json { render json: @roombooking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roombookings/1
  # DELETE /roombookings/1.json
  def destroy
    @roombooking.destroy
    respond_to do |format|
      format.html { redirect_to roombookings_url, notice: 'Roombooking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roombooking
      @roombooking = Roombooking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roombooking_params
      params.require(:roombooking).permit(:room_id, :starttime, :endtime, :description, :user_id)
    end
end
