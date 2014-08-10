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
    render :json=>{:test =>"show"}
  end

  def update
    render :json=>{:test => "update"}
  end

  def destroy
    render :json=>{:test => "destroy"}
  end

  def project_create(project_name, raw_data)
    result = {}
    begin
      project = Project.where("projects_docs ? '#{project_name}'")
      if project.length > 0
        result[:db_status] = "existed"
        return result
      else
        projects = Project.new
        projects.projects_docs = ActiveSupport::JSON.decode(raw_data)
        projects.save
      end
    rescue
      result[:db_status] = "error"
      return result
    end
    result[:db_status] = "success"

    begin
      project_git = History::History.init
      project_git_file = History::GIT_PROJECTS + '/project_'+ project_name
      f = File.open(project_git_file,"w")
      f.puts(ActiveSupport::JSON.decode(raw_data))
      #f.write(raw_data) #why Chinese will failed for this function
      f.close
      History::History.add_and_commit(project_git, project_name + "_demo")
    rescue
      result[:history_status] = "error"
      return result
    end
    result[:history_status] = "success"
    return result
  end

end
