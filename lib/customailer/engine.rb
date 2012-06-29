module Customailer
  class Engine < ::Rails::Engine
    isolate_namespace Customailer

    config.generators do |g|
      g.test_framework :rspec
      g.integration_tool :rspec
    end

    initializer "customailer.prepend_view_path" do |app|
      ActiveSupport.on_load(:action_mailer) do
        prepend_view_path Customailer::MailTemplate::Resolver.instance
      end
    end
  end
end
