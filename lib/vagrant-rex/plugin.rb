require "vagrant"

module VagrantPlugins
  module Rex
    class Plugin < Vagrant.plugin("2")
      name "rex"
      description <<-DESC
      Provides support for porvisioning your virtual machines with
      rex.
      DESC

      config(:rex, :provisioner) do
        require_relative 'config'
        Config
      end

      provisioner(:rex) do
	I18n.load_path << File.expand_path(
          'locales/en.yml',
          Rex.source_root
        )
        I18n.reload!

	require_relative 'provisioner'
        Provisioner
      end
    end
  end
end
