module Common
  class PluginRouter
    def self.plugin_router(project_name, plugin_name, plugin_action ,raw_data)
      case plugin_name
        when 'cucumber'
          Plugins::Cucumber.main(project_name, plugin_action, raw_data)
        else
          return {:plugin => "not found"}
      end
    end

  end
end
