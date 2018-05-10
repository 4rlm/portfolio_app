class AlgosController < ApplicationController
  before_action :set_algo, only: [:show, :edit, :update, :destroy ]
  # before_action :set_algo_service, only: [:run_sudoku]
  before_action :set_algo_service

  # GET /algos
  # GET /algos.json
  def index
    @algos = Algo.all
  end

  # GET /algos/1
  # GET /algos/1.json
  def show
  end

  # GET /algos/new
  def new
    @algo = Algo.new
  end

  # GET /algos/1/edit
  def edit
  end

  # POST /algos
  # POST /algos.json
  def create
    @algo = Algo.new(algo_params)

    respond_to do |format|
      if @algo.save
        format.html { redirect_to @algo, notice: 'Algo was successfully created.' }
        format.json { render :show, status: :created, location: @algo }
      else
        format.html { render :new }
        format.json { render json: @algo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /algos/1
  # PATCH/PUT /algos/1.json
  def update
    respond_to do |format|
      if @algo.update(algo_params)
        format.html { redirect_to @algo, notice: 'Algo was successfully updated.' }
        format.json { render :show, status: :ok, location: @algo }
      else
        format.html { render :edit }
        format.json { render json: @algo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /algos/1
  # DELETE /algos/1.json
  def destroy
    @algo.destroy
    respond_to do |format|
      format.html { redirect_to algos_url, notice: 'Algo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  ##### SERVICE RELATED METHODS BELOW #####


  def run_all_benchmarks
    @service.run_all_benchmarks
    flash[:notice] = "Started Running Benchmarks"
    respond_to do |format|
      format.js { render :update_service }
    end
  end


  def run_sudoku
    @service.run_sudoku
    flash[:notice] = "Sudoko Started!"
    respond_to do |format|
      format.js { render :update_service }
    end
  end

  def run_anagrams
    @service.run_anagrams
    flash[:notice] = "Sudoko Started!"
    respond_to do |format|
      format.js { render :update_service }
    end
  end

  def run_roman_numerals
    @service.run_roman_numerals
    flash[:notice] = "Sudoko Started!"
    respond_to do |format|
      format.js { render :update_service }
    end
  end

  def run_word_ranker
    @service.run_word_ranker
    flash[:notice] = "Sudoko Started!"
    respond_to do |format|
      format.js { render :update_service }
    end
  end

  def run_pig_latin
    @service.run_pig_latin
    flash[:notice] = "Sudoko Started!"
    respond_to do |format|
      format.js { render :update_service }
    end
  end

  def run_palindrome
    @service.run_palindrome
    flash[:notice] = "Sudoko Started!"
    respond_to do |format|
      format.js { render :update_service }
    end
  end

  def run_word_search
    @service.run_word_search
    flash[:notice] = "Sudoko Started!"
    respond_to do |format|
      format.js { render :update_service }
    end
  end

  def run_ssn_tool
    @service.run_ssn_tool
    flash[:notice] = "Sudoko Started!"
    respond_to do |format|
      format.js { render :update_service }
    end
  end

  ##### SERVICE RELATED METHODS ABOVE #####

  private


  def set_algo_service
    @service = AlgoService.new
    @data = nil
  end


    # Use callbacks to share common setup or constraints between actions.
    def set_algo
      @algo = Algo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def algo_params
      params.fetch(:algo, {})
    end
end
