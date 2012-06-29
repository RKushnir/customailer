class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def simple_message
    mail(to: 'user@example.com', subject: 'hello')
  end
end
