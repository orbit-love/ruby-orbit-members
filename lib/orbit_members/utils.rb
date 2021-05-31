# frozen_string_literal: true

module OrbitMembers
  class Utils
    def self.valid_json?(string)
      !JSON.parse(string).nil?
    rescue JSON::ParserError
      raise ArgumentError,
            "Expected confirmation from the Orbit API, but received nothing. Please check your logs and try again."
    end
  end
end
