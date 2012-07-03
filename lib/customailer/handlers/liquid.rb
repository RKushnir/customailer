require 'liquid'

module Customailer
  module Handlers
    class Liquid
      def self.call(template)
        "Customailer::Handlers::Liquid.new(self).render(#{template.source.inspect}, local_assigns)"
      end

      def initialize(view)
        @view = view
      end

      def render(template, local_assigns = {})
        @view.controller.headers["Content-Type"] ||= 'text/html; charset=utf-8'

        assigns = @view.assigns
        if @view.content_for?(:layout)
          assigns["content_for_layout"] = @view.content_for(:layout)
        end

        assigns.merge!(local_assigns.stringify_keys)
        controller = @view.controller

        filters = if controller.respond_to?(:liquid_filters, true)
          controller.send(:liquid_filters)
        elsif controller.respond_to?(:master_helper_module)
          [controller.master_helper_module]
        else
          [controller._helpers]
        end

        liquid = ::Liquid::Template.parse(template)
        liquid.render(assigns, filters: filters, registers: {action_view: @view, controller: @view.controller})
      end

      def compilable?
        false
      end
    end
  end
end
