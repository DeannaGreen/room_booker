class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /homes
  # GET /homes.json
  def dashboard
    @homes = Home.all
    if Room.count == 0 
      # create some demo data
      t = Time.now  + 1*60*60
      t2 = Time.now +  2*60*60
      
      room = Room.new(:roomname => 'Meeting Room 1')
		  room.roombookings.build(:description => 'Happy Muffin Demo' , :user_id => current_user.id , :starttime => t , :endtime => t2 )
      room.save
      
    end
    
    
    @todaybookings = Roombooking.all.where("date(starttime) = ?", Date.today )
    @tomorrowbookings = Roombooking.all.where("date(starttime) = ?", Date.tomorrow )
    @yourbookings = Roombooking.all.where("user_id = '?'", current_user.id).where("date(starttime) >= ?", Date.today )
  end

  def index
  end
  # GET /homes/1
  # GET /homes/1.json
  def show
  end

  # GET /homes/new
  def new
    @home = Home.new
  end

  # GET /homes/1/edit
  def edit
  end

  # POST /homes
  # POST /homes.json
  def create
    @home = Home.new(home_params)

    respond_to do |format|
      if @home.save
        format.html { redirect_to @home, notice: 'Home was successfully created.' }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homes/1
  # PATCH/PUT /homes/1.json
  def update
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to @home, notice: 'Home was successfully updated.' }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1
  # DELETE /homes/1.json
  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_url, notice: 'Home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params.require(:home).permit(:paragraph_1, :paragraph_2, :paragraph_3)
    end
end
