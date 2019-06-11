class InvitationsController < ApplicationController
  before_action :set_token, only: [:accept]
  before_action :ensure_token_presence, only: [:accept]
  before_action :set_invitation, only: [:accept]

  def accept
    if @invitation&.expired?
      @invitation.update(accepted_at: Time.current)
      redirect_to root_path, notice: 'Well done, let\'s get started!'
    else
      redirect_to root_path, alert: 'Invalid Token'
    end
  end

  private

  def set_token
    @token = params[:token]
  end

  def validate_token
    redirect_to root_path, alert: 'Token required' if @token.blank?
  end

  def set_invitation
    @invitation = Invitation.find_by(token: @token)
  end
end