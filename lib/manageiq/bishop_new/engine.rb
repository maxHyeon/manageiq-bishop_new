module Manageiq
  module BishopNew
    class Engine < ::Rails::Engine
      isolate_namespace Manageiq::BishopNew
      def vmdb_plugin?
        true
      end

      initializer 'plugin.assets' do |app|
        app.config.assets.paths << root.join('assets', 'images').to_s
      end


      initializer 'plugin' do
        Menu::CustomLoader.register(
            Menu::Section.new(:Bishop, N_("Bishop"), 'fa fa-plus', [
                Menu::Item.new('hourly', N_("Hourly"), 'hourly', {:feature => 'hourly', :any => true}, '/bishop#/hourly'),
                Menu::Item.new('monthly', N_("Monthly"), 'monthly', {:feature => 'monthly', :any => true}, '/bishop#/monthly'),
                Menu::Item.new('onceAMinute', N_("Every 10 Minute"), 'mappings', {:feature => 'mappings', :any => true}, '/bishop#/onceMin'),
                Menu::Item.new('bishop_setting', N_("Bishop Settings"), 'bishop_settings', {:feature => 'bishop_settings', :any => true}, '/bishop#/settings')
            ], nil, nil, nil, nil, :compute)
        )
      end
      def self.plugin_name
        _('BishopNew')
      end
    end
  end
end
