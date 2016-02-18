require "segv_silencer/version"
require "segv_silencer/segv_silencer"

module SegvSilencer
  @message = "[SEGV] segv_silencer"
  def self.message; @message end
  def self.message=(msg) @message = msg end
end
