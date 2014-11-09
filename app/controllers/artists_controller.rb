require 'acts-as-taggable-on'

class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  autocomplete :tag, :name, class_name: 'ActsAsTaggableOn::Tag', :full => true
  before_action :role_required

  def index
    if params[:tag]
      @artists = Artist.tagged_with(params[:tag])
    else
      @artists = Artist.all
    end
  end

  def new
    @artist = Artist.new
  end

  def edit
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to artists_path, notice: 'Artist was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @artist.update(artist_params)
      redirect_to artists_path, notice: 'Artist was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_url
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :default_song_url, :tag_list)
  end
end