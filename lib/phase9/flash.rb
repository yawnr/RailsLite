require 'json'
require 'webrick'

module Phase9
  class Flash
    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
      @flash = nil

      req.cookies.each do |cookie|
        if cookie.name == "_rails_lite_app"
          @flash = JSON.parse(cookie.value)
        end
      end

      @flash ||= {}

      @flash
    end

    def [](key)
      @flash[key]
    end

    def []=(key, val)
      @flash[key] = val
    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_flash(res)
      cookie = WEBrick::Cookie.new("_rails_lite_app", @flash.to_json)
      cookie.path = '/'
      res.cookies << cookie
    end
  end
end
