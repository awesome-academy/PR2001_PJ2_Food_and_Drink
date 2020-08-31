class UserMailer < Devise::Mailer
    include Devise::Controllers::UrlHelpers
    default template_path: 'users/mailer' 
    def account_activation(user)
        @user = user
        mail to: username.email, subject: "Account Activation" 
    end

    def password_reset(user)
        @user = user
        mail to: username.email, subject: "Password Reset"
    end 
    def welcome_reset_password_instructions(user)
        mail(to: username.email, subject: 'Welcome to the New Site')
    end
end