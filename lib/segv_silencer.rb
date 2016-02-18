require "segv_silencer/version"
require "segv_silencer/segv_silencer"

module SegvSilencer
  @message = "[SEGV] segv_silencer"
  class << self
    attr_accessor :message, :file
  end
end
