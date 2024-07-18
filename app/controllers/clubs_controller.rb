class ClubsController < ApplicationController
  before_action :set_club, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  after_action :verify_authorized, except: %i[index show]

  def index
    @clubs = policy_scope(Club)
  end

  def show
    authorize @club
  end

  def new
    @club = Club.new
    authorize @club
  end

  def edit
    authorize @club
  end

  def create
    @club = Club.new(club_params)
    authorize @club
    if @club.save
      redirect_to @club, notice: 'Club was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @club
    if @club.update(club_params)
      redirect_to @club, notice: 'Club was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @club
    @club.destroy
    redirect_to clubs_url, notice: 'Club was successfully destroyed.'
  end

  private

  def set_club
    @club = Club.find(params[:id])
  end

  def club_params
    params.require(:club).permit(:name, :description)
  end
end
