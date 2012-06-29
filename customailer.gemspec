$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "customailer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "customailer"
  s.version     = Customailer::VERSION
  s.authors     = ["Roman Kushnir"]
  s.email       = ["broilerster@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "Customize email templates."
  s.description = "Customailer allows to override and edit mailer templates directly on the site without touching the application view files."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.0"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
end
