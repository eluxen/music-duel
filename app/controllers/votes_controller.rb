class VotesController < ApplicationController
  before_action :set_duel
  before_action :set_vote, only: :update
  before_action :login_required

  # POST /votes
  # POST /votes.json
  def create
    @vote = @duel.votes.create(vote_params)

    redirect_to @vote.duel, notice: 'Vote was successfully submitted.' 
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    vote.update(vote_params)
    redirect_to @vote, notice: 'Vote was successfully updated.' 
  end

  private
  
  def set_duel
    @duel = Duel.find(params[:duel_id])
  end

  def set_vote
    @vote = Vote.find(params[:id])
    @owner_check_object = @vote
  end

  def vote_params
    params.permit(:duel_id, :artist_id, :user_id)
  end
end
