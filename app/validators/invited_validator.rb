class InvitedValidator < ActiveModel::EachValidator
  ERROR_MESSAGE = 'must have been invited'.freeze

  def validate_each(record, attribute, value)
    record.errors.add(attribute, ERROR_MESSAGE) unless has_been_invited?(value)
  end

  private

  def has_been_invited?(email)
    Invitation.where(email: email).exists?
  end
end
