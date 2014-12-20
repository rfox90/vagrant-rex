require "pathname"

require "vagrant-rex/plugin"

module VagrantPlugins
  module Rex
    lib_path = Pathname.new(File.expand_path("../vagrant-rex", __FILE__))

    # This returns the path to the source of this plugin.
    #
    # @return [Pathname]
    def self.source_root
      @source_root ||= Pathname.new(File.expand_path("../../", __FILE__))
    end
  end
end
