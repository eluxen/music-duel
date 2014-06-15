class VotesController < ApplicationController
  before_action :set_duel
  before_action :set_vote, only: :update
  before_action :login_required

  # POST /votes
  # POST /votes.json
  def create
    @vote = @duel.votes.create(vote_params)

    respond_to do |format|
      if @vote
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vote }
      else
        format.html { render action: 'new' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def set_duel
    @duel = Duel.find(params[:duel_id])
  end

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:duel_id, :artist_id, :username)
  end
end
