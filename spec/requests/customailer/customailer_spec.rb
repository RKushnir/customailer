require 'spec_helper'

describe Customailer do
  it "provides mailer templates from database" do
    Customailer::MailTemplate.create!(body: "Hello, Dear User", path: 'user_mailer/simple_message')

    Customailer::MailTemplate.create!(
      body: "Hello, Dear User",
      path: "user_mailer/simple_message",
      format: "html",
      locale: "en",
      handler: "erb",
      partial: false)

    email = UserMailer.simple_message
    email.body.encoded.should match("Hello, Dear User")
  end
end
