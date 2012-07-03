class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def simple_message
    mail(to: 'user@example.com', subject: 'hello')
  end

  def interpolated_message(user_name)
    @user_name = user_name
    mail(to: 'user@example.com', subject: 'hello')
  end
end
