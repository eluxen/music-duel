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

  def latest
    @duel = Duel.last
    render action: 'show'
  end

  def new
    @duel = Duel.new
  end

  def edit
  end

  def update
    if @duel.update(duel_params)
      redirect_to duels_path, notice: 'Duel was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def create
    @duel = Duel.new(duel_params)

    if @duel.save
      redirect_to @duel, notice: 'Duel was successfully created.'
    else
      render action: 'new'
      
    end
  end

  def destroy
    @duel.destroy
    redirect_to duels_url
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