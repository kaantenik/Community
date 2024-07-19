class MembershipRequestsController < ApplicationController
  before_action :set_membership_request, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @membership_requests = policy_scope(MembershipRequest)
  end

  def show
  end

  def new
    @membership_request = MembershipRequest.new(club_id: params[:club_id])
  end


  def create
    @membership_request = MembershipRequest.new(membership_request_params)
    @membership_request.user = current_user

    if @membership_request.save
      redirect_to @membership_request, notice: 'Üyelik talebi başarıyla oluşturuldu.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @membership_request.update(membership_request_params)
      redirect_to @membership_request, notice: 'Üyelik talebi başarıyla güncellendi.'
    else
      render :edit
    end
  end

  def destroy
    @membership_request.destroy
    redirect_to membership_requests_url, notice: 'Üyelik talebi başarıyla silindi.'
  end

  private

  def set_membership_request
    @membership_request = MembershipRequest.find(params[:id])
  end

  def membership_request_params
    params.require(:membership_request).permit(:club_id, :approved)
  end
end
