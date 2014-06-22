class DuelsController < ApplicationController
  before_action :set_duel, only: [:show, :edit, :update, :destroy]
  before_action :login_required
  before_action :role_required,  except: [:show]

  autocomplete :artist, :name, full: true

  def index
    @duels = Duel.all
  end

  def show
  end

  def new
    @duel = Duel.new
  end

  def edit
  end

   def update
    respond_to do |format|
      if @duel.update(duel_params)
        format.html { redirect_to duels_path, notice: 'Duel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @duel.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def destroy
    @duel.destroy
    respond_to do |format|
      format.html { redirect_to duels_url }
      format.json { head :no_content }
    end
  end

  private

  def set_duel
    @duel = Duel.find(params[:id])
     @owner_check_object = @duel
  end

  def duel_params
    params.require(:duel).permit(:deadline, :description, :artist_a_id, :artist_b_id)
  end
end
