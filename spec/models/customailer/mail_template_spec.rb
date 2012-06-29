require 'spec_helper'

module Customailer
  describe MailTemplate do

    let!(:mail_template) { Customailer::MailTemplate.create!(
        body: "Listing users",
        path: "users/index",
        format: "html",
        locale: "en",
        handler: "erb",
        partial: false)
    }

    let(:resolver) { MailTemplate::Resolver.instance }
    let(:cache_key) { Object.new }
    let(:details) { {formats: [:html], locale: [:en], handlers: [:erb]} }

    before do
      t = resolver.find_all("index", "users", false, details, cache_key).first
      t.source.should == "Listing users"
    end

    it "expires the cache on update" do
      mail_template.update_attributes(body: "New body for template")
      t = resolver.find_all("index", "users", false, details, cache_key).first
      t.source.should =="New body for template"
    end

    it "expires the cache on destroy" do
      mail_template.destroy
      resolver.find_all("index", "users", false, details, cache_key).should be_empty
    end
  end
end
