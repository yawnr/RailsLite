require_relative '../phase2/controller_base'
require 'active_support'
require 'active_support/core_ext'
require 'erb'
require 'active_support/inflector'

module Phase3
  class ControllerBase < Phase2::ControllerBase
    # use ERB and binding to evaluate templates
    # pass the rendered html to render_content
    def render(template_name)
      file_path = "views/#{self.class.name.underscore}/#{template_name}.html.erb"

      text_to_render = File.read(file_path)

      render_content(ERB.new(text_to_render).result(binding),
                                                "text/html")
    end
  end
end
