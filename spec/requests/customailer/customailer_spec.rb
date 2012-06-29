require 'spec_helper'

describe Customailer do
  let (:email) { UserMailer.simple_message }

  after do
    Customailer::MailTemplate::Resolver.instance.clear_cache
  end

  context "when there's a template in the database" do
    before do
      Customailer::MailTemplate.create!(
        body: "Hello, Dear User",
        path: "user_mailer/simple_message",
        format: "html",
        locale: "en",
        handler: "erb",
        partial: false)
    end

    it "fetches template from the database" do
      email.body.encoded.should match("Hello, Dear User")
    end
  end

  context "when there's no template in the database" do
    it "uses the template from the filesystem" do
      email.body.encoded.should match("Template from the file")
    end
  end
end
