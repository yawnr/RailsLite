require_relative '../phase6/controller_base'
require_relative './flash'

module Phase9
  class ControllerBase < Phase6::ControllerBase

    def redirect_to(url)
      flash.store_flash(@res)
      super
    end

    def render_content(content, content_type)
      flash.store_flash(@res)
      super
    end

    def flash
      @flash ||= Flash.new(@req)
    end
  end
end
