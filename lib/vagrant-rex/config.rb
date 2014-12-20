module VagrantPlugins
  module Rex
    class Config < Vagrant.plugin('2', :config)
      attr_accessor :script
      attr_accessor :only
      attr_accessor :test
      attr_accessor :verbose
      attr_accessor :cloud
      attr_accessor :force

      def initialize
        self.file   = UNSET_VALUE
        self.verbose  = UNSET_VALUE
        self.force    = UNSET_VALUE
        self.tasks    = UNSET_VALUE
      end

      def finalize!
        self.file   = nil if script == UNSET_VALUE
        self.verbose  = nil if verbose == UNSET_VALUE
        self.force    = nil if force == UNSET_VALUE
        self.tasks = [] if tasks == UNSET_VALUE
      end

      def validate(machine)
        errors = []

        if file
          unless Pathname.new(file).expand_path(machine.env.root_path).file?
            errors << I18n.t(
              'vagrant.provisioners.Rex.script_path_invalid',
              :path => expanded_path
            )
          end
        else
          errors << I18n.t('vagrant.provisioners.Rex.no_script')
        end

        { 'Rex provisioner' => errors }
      end
    end
  end
end
