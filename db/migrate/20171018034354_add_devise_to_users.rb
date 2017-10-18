class AddDeviseToUsers < ActiveRecord::Migration[5.1]
  def change
    # Database authenticatable
    change_column_default :users, :email, from: nil, to: ""
    change_column_null :users, :email, false
    add_column :users, :encrypted_password, :string, null: false, default: ""

    # Recoverable
    add_column :users, :reset_password_token,   :string
    add_column :users, :reset_password_sent_at, :datetime

    # Rememberable
    add_column :users, :remember_created_at, :datetime

    # Trackable
    add_column :users, :sign_in_count,      :integer, default: 0, null: false
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at,    :datetime
    add_column :users, :current_sign_in_ip, :inet
    add_column :users, :last_sign_in_ip,    :inet

    # Confirmable
    add_column :users, :confirmation_token,   :string
    add_column :users, :confirmed_at,         :datetime
    add_column :users, :confirmation_sent_at, :datetime

    # Lockable
    add_column :users, :failed_attempts,  :integer, default: 0, null: false # Only if lock strategy is :failed_attempts
    add_column :users, :unlock_token,     :string # Only if unlock strategy is :email or :both
    add_column :users, :locked_at,        :datetime

    # Correct existing fields
    change_column_default :users, :username, from: nil, to: ""
    change_column_null :users, :username, false

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token,   unique: true
    add_index :users, :unlock_token,         unique: true
  end
end
