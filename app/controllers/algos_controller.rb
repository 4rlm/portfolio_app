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
  # attr_accessor :original_text, :title, :num, :arabic_nums, :search_word, :puzzle

  def run_all_benchmarks
    args = {num: params[:num]}
    @service.run_all_benchmarks(args)
    flash[:notice] = "Benchmark Started"
    respond_to do |format|
      format.js { render :update_service }
    end
  end


  def run_roman_numerals
    args = {arabic_nums: params[:input]}
    @service.run_roman_numerals(args)
    flash[:notice] = "Roman Numerals Started!"
    respond_to do |format|
      format.js { render :update_service }
    end
  end


  def run_word_ranker
    args = {original_text: params[:original_text], title: params[:title]}
    @service.run_word_ranker(args)
    flash[:notice] = "Word Ranker Started!"
    respond_to do |format|
      format.js { render :update_service }
    end
  end


  def run_anagrams
    args = {original_text: params[:original_text]}
    @service.run_anagrams(args)
    flash[:notice] = "Anagrams Started!"
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


  def run_pig_latin
    args = {original_text: params[:original_text]}
    @service.run_pig_latin(args)
    flash[:notice] = "Pig Latin Started!"
    respond_to do |format|
      format.js { render :update_service }
    end
  end


  def run_palindrome
    args = {original_text: params[:original_text]}
    @service.run_palindrome(args)
    flash[:notice] = "Palindrome Started!"
    respond_to do |format|
      format.js { render :update_service }
    end
  end


  def run_word_search
    args = {search_word: params[:search_word], puzzle: params[:puzzle]}
    @service.run_word_search(args)
    flash[:notice] = "Word Search Started!"
    respond_to do |format|
      format.js { render :update_service }
    end
  end


  def run_ssn_tool
    args = {original_text: params[:original_text]}
    @service.run_ssn_tool(args)
    flash[:notice] = "Social Security Validator Started!"
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
