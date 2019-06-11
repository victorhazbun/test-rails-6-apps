class SendInvitation

  DAYS_TO_EXPIRE = 2.freeze

  attr_reader :invitation

  def self.call(invitation:, token:)
    new(invitation, token).call
  end

  def call
    async_email_notification
    update_invitation
    invitation
  end

  private

  def initialize(invitation, token)
    @invitation = invitation
    @token = token
  end

  def async_email_notification
    InvitationMailer
      .with(invitation: invitation)
      .notification
      .deliver_later
  end

  def update_invitation
    invitation.update(
      sent_at: Time.current,
      token: @token,
      expiration_at: DAYS_TO_EXPIRE.days.from_now.end_of_day
    )
  end
end