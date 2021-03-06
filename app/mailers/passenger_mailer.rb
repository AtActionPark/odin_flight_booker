class PassengerMailer < ApplicationMailer
  default from: 'notification@example.com'

  def welcome_email user
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Booking')
  end
end
