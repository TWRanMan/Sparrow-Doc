class ProjectsController < ApplicationController
  respond_to :json

  def create
    post_data = request.body.read
    Common::PluginRouter.plugin_router(params['project_name'], params['plugin'], params['action'], post_data)
    render :json=>"{test：create}"
  end

  def read
    render :json=>"{test:show}"
  end

  def update
    render :json=>"{test:update}"
  end

  def destroy
    render :json=>"{test:destroy}"
  end
end
