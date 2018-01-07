module BlizzardApiClient
  class WsClient
    def initialize(options = {})
      [ :protocol,
        :host,
        :port,
        :http_open_timeout,
        :http_read_timeout,
        :region,
        :locale,
        :api_key
      ].each do |option|
        instance_variable_set("@#{option}", options[option])
      end
    end
  end
end