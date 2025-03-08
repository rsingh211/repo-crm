# frozen_string_literal: true

class AddDeviseToAdminUsers < ActiveRecord::Migration[8.0]
  def self.up
    change_table :admin_users, bulk: true do |t|
      unless column_exists?(:admin_users, :email)
        t.string :email, null: false, default: ""
      end

      unless column_exists?(:admin_users, :encrypted_password)
        t.string :encrypted_password, null: false, default: ""
      end

      # Add other Devise columns conditionally
      unless column_exists?(:admin_users, :reset_password_token)
        t.string :reset_password_token
      end

      unless column_exists?(:admin_users, :reset_password_sent_at)
        t.datetime :reset_password_sent_at
      end

      unless column_exists?(:admin_users, :remember_created_at)
        t.datetime :remember_created_at
      end
    end

    # Adding indexes for unique columns
    add_index :admin_users, :email, unique: true unless index_exists?(:admin_users, :email)
    add_index :admin_users, :reset_password_token, unique: true unless index_exists?(:admin_users, :reset_password_token)
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
