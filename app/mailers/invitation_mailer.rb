class InvitationMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def notification
    @invitation = params[:invitation]
    mail(
      to: @invitation.invited_email,
      subject: I18n.t('invitation.notification.subject')
    )
  end
end
