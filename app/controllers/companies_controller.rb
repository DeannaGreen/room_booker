class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:new, :create]

  # GET /companies
  # GET /companies.json
  def index
    @company = Company.find_by_subdomain(current_user.subdomain)
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company , @user = Company.create_with_admin(company_params, user_params)

   # redirect_to request.url.sub(@company, 'www'), notice: 'Company was successfully created.'

  
    #@user = User.new(user_params.merge(admin: true,subdomain:@company.subdomain))
    sign_in_and_redirect @user
    
    # create some demo data
    room = Room.new(:roomname => 'Meeting Room 1')
		room.roombookings.build(:description => 'Happy Muffin Demo' , :user_id => @user.id)
		room.save
    
    # respond_to do |format|find_by_email(user_params[:email])
    #   if @company.save
    #     format.json { render :show, status: :created, location: @company }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @company.errors, status: :unprocessable_entity }
    #   end
    #end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:companyname, :subdomain)
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
