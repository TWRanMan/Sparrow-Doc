module Plugins
  class Cucumber
    def self.main(project_name, action, raw_data)
      case action
        when 'create'
          create(raw_data)
        when 'read'
          read()
        when 'update'
          update()
        when 'destroy'
          destroy()
        else
          return false
      end

    end
    def self.create(raw_data)
      return raw_data
    end
  end
end
