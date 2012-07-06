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

    initializer "customailer.register_liquid_handler" do |app|
      ActiveSupport.on_load(:action_view) do
        require 'customailer/handlers/liquid'
        ActionView::Template.register_template_handler :liquid, Customailer::Handlers::Liquid
      end
    end

    initializer "customailer.extend_liquid_filters" do |app|
      ActiveSupport.on_load(:action_view) do
        require 'customailer/liquid_filters'
        ::Liquid::Template.register_filter Customailer::LiquidFilters
      end
    end
  end
end
