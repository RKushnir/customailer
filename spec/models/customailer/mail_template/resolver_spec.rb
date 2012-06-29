require 'spec_helper'

module Customailer
  describe MailTemplate::Resolver do
    subject { MailTemplate::Resolver.instance }

    it "returns the template with the saved body" do
      details = {formats: [:html], locale: [:en], handlers: [:erb] }

      subject.find_all("index", "posts", false, details).should be_empty

      MailTemplate.create!(
        body: "<%= 'Hi from MailTemplate!' %>",
        path: "posts/index",
        format: "html",
        locale: "en",
        handler: "erb",
        partial: false)

      template = subject.find_all("index", "posts", false, details).first
      template.should be_kind_of(ActionView::Template)
      template.source.should == "<%= 'Hi from MailTemplate!' %>"
      template.identifier.should match(/MailTemplate - \d+ - "posts\/index"/)
      template.handler.should be_kind_of(ActionView::Template::Handlers::ERB)
      template.formats.should == [:html]
      template.virtual_path.should == "posts/index"
    end
  end
end
