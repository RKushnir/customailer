module Customailer
  class Engine < ::Rails::Engine
    isolate_namespace Customailer

    config.generators do |g|
      g.test_framework :rspec
      g.integration_tool :rspec
    end
  end
end
