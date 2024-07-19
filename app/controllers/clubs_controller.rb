class ClubsController < ApplicationController
  before_action :set_club, only: %i[show edit update destroy members membership_requests approve_membership_request reject_membership_request]
  before_action :authenticate_user!, except: %i[index show]
  after_action :verify_authorized, except: %i[index show]

  def members
    @club = Club.find(params[:id])
    authorize @club
    @members = @club.membership_requests.where(approved: true).map(&:user)
  end

  def membership_requests
    authorize @club, :membership_requests?
    @membership_requests = policy_scope(@club.membership_requests.where(approved: nil))
  end

  def approve_membership_request
    membership_request = MembershipRequest.find(params[:membership_request_id])
    authorize @club
    membership_request.update(approved: true)
    redirect_to membership_requests_club_path(@club), notice: 'Üyelik talebi onaylandı.'
  end

  def reject_membership_request
    membership_request = MembershipRequest.find(params[:membership_request_id])
    authorize @club
    membership_request.update(approved: false)
    redirect_to membership_requests_club_path(@club), notice: 'Üyelik talebi reddedildi.'
  end

  def index
    @clubs = policy_scope(Club)
  end

  def show
    authorize @club
    @members = @club.membership_requests.where(approved: true).map(&:user)
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
      redirect_to @club, notice: 'Kulüp başarıyla oluşturuldu.'
    else
      render :new
    end
  end

  def update
    authorize @club
    if @club.update(club_params)
      redirect_to @club, notice: 'Kulüp başarıyla güncellendi.'
    else
      render :edit
    end
  end

  def destroy
    authorize @club
    @club.destroy
    redirect_to clubs_url, notice: 'Kulüp başarıyla kaldırıldı.'
  end

  private

  def set_club
    @club = Club.find(params[:id])
  end

  def club_params
    params.require(:club).permit(:name, :description)
  end

end
