require 'json'
require 'webrick'

module Phase4
  class Session
    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
      @cookiedata = nil

      req.cookies.each do |cookie|
        if cookie.name == "_rails_lite_app"
          @cookiedata = JSON.parse(cookie.value)
        end
      end

      @cookiedata ||= {}

    end

    def [](key)
      @cookiedata[key]
    end

    def []=(key, val)
      @cookiedata[key] = val
    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_session(res)
      cookie = WEBrick::Cookie.new("_rails_lite_app", @cookiedata.to_json)
      res.cookies << cookie
    end
  end
end
