class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    @greeting = "Bem vindo"

    mail(to: "user@.email", subject: 'Bem vindo ao MedShare, sua plataforma de doação de medicamentos'
  end

  def welcome
    user = User.first
    UserMailer.welcome(user)
  end
end
