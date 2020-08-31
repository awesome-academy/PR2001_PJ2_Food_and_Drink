# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :username
      t.string :gender
      t.date :birth
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      # bao mat va luu tru du lieu va kiem tra tinh xac thuc cua user
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      # reset mat khau va huong dan ng dung thuc hien

      ## Rememberable
      t.datetime :remember_created_at
      # tao ma

      ## Trackable
       t.integer  :sign_in_count, default: 0, null: false
       t.datetime :current_sign_in_at
       t.datetime :last_sign_in_at
       t.string   :current_sign_in_ip
       t.string   :last_sign_in_ip
      #  theo doi so lan dang nhap va dia chi IP

      #Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email 
      # gui email xac nhan va xac minh voi tai khoan vua dang ky

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      # khoa tai khoan sau khi 1 vai lan ko dang nhap dc, mo khoa thong qua email


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
