class ThermosController < ApplicationController
  before_action :set_thermo, only: [:show, :edit, :update, :destroy]
  # before_action :set_thermo_service, only: [:core_comp_cleaner_btn] # Service Ex.
  before_action :set_thermo_service, only: [:core_comp_cleaner_btn]


  # GET /thermos
  # GET /thermos.json
  def index
    @thermos = Thermo.all
  end

  # GET /thermos/1
  # GET /thermos/1.json
  def show
  end

  # GET /thermos/new
  def new
    @thermo = Thermo.new
  end

  # GET /thermos/1/edit
  def edit
  end

  # POST /thermos
  # POST /thermos.json
  def create
    @thermo = Thermo.new(thermo_params)

    respond_to do |format|
      if @thermo.save
        format.html { redirect_to @thermo, notice: 'Thermo was successfully created.' }
        format.json { render :show, status: :created, location: @thermo }
      else
        format.html { render :new }
        format.json { render json: @thermo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thermos/1
  # PATCH/PUT /thermos/1.json
  def update
    respond_to do |format|
      if @thermo.update(thermo_params)
        format.html { redirect_to @thermo, notice: 'Thermo was successfully updated.' }
        format.json { render :show, status: :ok, location: @thermo }
      else
        format.html { render :edit }
        format.json { render json: @thermo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thermos/1
  # DELETE /thermos/1.json
  def destroy
    @thermo.destroy
    respond_to do |format|
      format.html { redirect_to thermos_url, notice: 'Thermo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # SERVICE EX
  # def core_comp_cleaner_btn
  #   @service.core_comp_cleaner_btn
  #   flash[:notice] = "Core(Comparison) cleaned successfully."
  #   redirect_to cores_path
  # end

  private


  def set_thermo_service
    @service = ThermoService.new
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_thermo
      @thermo = Thermo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thermo_params
      params.fetch(:thermo, {})
    end
end
