class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.string :invited_email
      t.string :invited_name
      t.string :token
      t.datetime :sent_at
      t.datetime :accepted_at
      t.datetime :expiration_at

      t.timestamps
    end
  end
end
