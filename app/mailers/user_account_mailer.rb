class UserAccountMailer < Devise::Mailer
  
  def reset_password_instructions(user_account)
    setup_mail(user_account, :reset_password_instructions)
  end
  
end