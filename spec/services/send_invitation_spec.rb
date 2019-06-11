require 'rails_helper'

RSpec.describe SendInvitation do
  # Test a service object which:
  # Receives an invitation and a token as arguments.
  # It schedules the invitation mailer job,
  # updates the invitation "sent at" attribute,
  # updates the invitation "token" attribute,
  # updates the invitation "expiration at" attribute,
  # and returns the invitation object.
  describe '.call' do
    before do
      @invitation = create(
        :invitation,
        sent_at: nil,
        accepted_at: nil,
        expiration_at: nil
      )
      @token = SecureRandom.uuid
    end

    it 'schedules the invitation mailer job' do
      expect do
        described_class.call(invitation: @invitation, token: @token)
      end.to have_enqueued_job
        .on_queue('mailers')
        .with(
          'InvitationMailer',
          'notification',
          'deliver_now',
          params: { invitation: @invitation },
          args: []
        )
    end

    it 'updates the invitation sent at attribute' do
      Timecop.freeze do
        expect do
          described_class.call(invitation: @invitation, token: @token)
        end.to change {
          Invitation.find(@invitation.id).sent_at&.to_s
        }.from(nil).to(Time.current.to_s)
      end
    end

    it 'updates the invitation token attribute' do
      expect do
        described_class.call(invitation: @invitation, token: @token)
      end.to change {
        Invitation.find(@invitation.id).token
      }.from(nil).to(@token)
    end

    it 'updates the invitation expiration at attribute' do
      Timecop.freeze do
        expect do
          described_class.call(invitation: @invitation, token: @token)
        end.to change {
          Invitation.find(@invitation.id).expiration_at&.to_s
        }.from(nil).to(2.days.from_now.end_of_day.to_s)
      end
    end

    it 'returns the invitation' do
      expect(described_class.call(invitation: @invitation, token: @token)).to eq @invitation
    end
  end
end