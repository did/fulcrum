class PublicView::BaseController < ApplicationController

  skip_before_filter :authenticate_user!

  before_filter :fetch_public_projects

  layout 'public_view'

  protected

  def fetch_public_projects
    @projects ||= Project.with_public_view
  end

  def fetch_project
    @project ||= self.fetch_public_projects.find(params[:project_id] || params[:id])
  end

end
