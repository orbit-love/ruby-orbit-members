# frozen_string_literal: true

require "zeitwerk"
require_relative "orbit_members/version"

module OrbitMembers
  loader = Zeitwerk::Loader.new
  loader.tag = File.basename(__FILE__, ".rb")
  loader.push_dir(__dir__)
  loader.setup
end
