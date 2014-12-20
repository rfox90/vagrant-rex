module VagrantPlugins
  module Rex
    class Provisioner < Vagrant.plugin('2', :provisioner)
      def provision
        command = ['rex'].concat(compile_options)
        #Todo, we need to run the rex script on the host, targeting the vagrant box's ssh port and details
        Vagrant::Util::Subprocess.execute(*command) do |type, data|
          if type == :stdout || type == :stderr
            machine.env.ui.info(data.chomp, :prefix => false)
          end
        end
      end

      private

      def compile_options
        options = []
        options << "--script=#{config.script}"
        options << "--only=#{config.only}" if config.only
        options << '--test' if config.test
        options << '--verbose' if config.verbose
        options << '--cloud' if config.cloud
        options << '--force' if config.force
        options << { :notify => [:stdout, :stderr] }
        options
      end
    end
  end
end
