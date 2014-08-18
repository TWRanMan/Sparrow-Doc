class ProjectsController < ApplicationController
  respond_to :json

  def create
    post_data = request.body.read
    if ! params['plugin'].nil?
      result = Common::PluginRouter.plugin_router(params['project_name'], params['plugin'], params['action'], post_data)
    else
      result = project_create(params['project_name'],post_data)
    end
    render :json=>result
  end

  def read
    if ! params['plugin'].nil?
      result = Common::PluginRouter.plugin_router(params['project_name'], params['plugin'], params['action'], post_data)
    else
      result = project_read(params['project_name'],params['key'])
    end
    render :json=>result
  end

  def update
    # current the update has a issue, https://github.com/rails/rails/issues/6127
    # it will be fixed in 4.2
    begin
      post_data = request.body.read
      if ! params['plugin'].nil?
        result = Common::PluginRouter.plugin_router(params['project_name'], params['plugin'], params['action'], post_data)
      else
        result = project_update(params['project_name'],post_data)
      end
      render :json=>result
    end
  end

  def destroy
    render :json=>{:test => "destroy"}
  end

#################################################################

  def project_create(project_name, raw_data)
    result = Hash.new
    result[:history_status] = project_history(project_name, raw_data)

    begin
      data_decoded= ActiveSupport::JSON.decode(raw_data)
      project_item = Project.where("projects_docs ? :key", :key => data_decoded.keys[0])
      if project_item.length > 0
        return result[:db_status] = "existed"
      else
        projects = Project.new
        projects.projects_docs = data_decoded
        projects.save
      end
      result[:db_status] = "success"
    rescue
      return result[:db_status] = "error"
    end

    return result
  end

  def project_read(project_name, key)
    begin
      result = Project.where("projects_docs ? :key", :key => key)
    rescue
      result[:db_status] = "error"
    end
    return result
  end

  def project_update(project_name, raw_data)
    result = Hash.new
    result[:history_status] = project_history(project_name, raw_data)

    begin
      data_decoded= ActiveSupport::JSON.decode(post_data)
      project_item = Project.where("projects_docs ? :key", :key => data_decoded.keys[0])
      if project_item.length < 0
        return result[:db_status] = "not existed"
      else
        project_item.first.projects_docs= data_decoded
        project_item.save
      end
      result[:db_status] = "success"
    rescue
      return result[:db_status] = "error"
    end

    return result
  end

  def project_history(project_name, raw_data)
    begin
      project_history = History::History.new(project_name)
      project_git_file = project_history.project_git_path + "/" + project_name
      f = File.open(project_git_file, "w")
      f.puts(ActiveSupport::JSON.decode(raw_data))
      f.close
      project_history.add_and_commit_all(project_name + "_demo")
      return "success"
    rescue
      return "error"
    end
  end

end
