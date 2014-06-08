class DuelsController < ApplicationController
  before_action :set_duel, only: [:show, :edit, :update, :destroy]

  # GET /duels
  # GET /duels.json
  def index
    @duels = Duel.all
  end

  # GET /duels/1
  # GET /duels/1.json
  def show
  end

  # GET /duels/new
  def new
    @duel = Duel.new
  end

  # GET /duels/1/edit
  def edit
  end

  # POST /duels
  # POST /duels.json
  def create
    @duel = Duel.new(duel_params)

    respond_to do |format|
      if @duel.save
        format.html { redirect_to @duel, notice: 'Duel was successfully created.' }
        format.json { render action: 'show', status: :created, location: @duel }
      else
        format.html { render action: 'new' }
        format.json { render json: @duel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /duels/1
  # PATCH/PUT /duels/1.json
  def update
    respond_to do |format|
      if @duel.update(duel_params)
        format.html { redirect_to @duel, notice: 'Duel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @duel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /duels/1
  # DELETE /duels/1.json
  def destroy
    @duel.destroy
    respond_to do |format|
      format.html { redirect_to duels_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_duel
      @duel = Duel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def duel_params
      params.require(:duel).permit(:deadline, :description, :artist_a, :artist_b)
    end
end
