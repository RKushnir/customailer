require "customailer/engine"

module Customailer
end

ActiveSupport.on_load(:action_mailer) do
  prepend_view_path Customailer::MailTemplate::Resolver.new
end
