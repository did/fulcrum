module PublicView
  class ProjectsController < BaseController

    # GET /public_projects
    # GET /public_projects.xml
    def index
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @projects }
      end
    end

    # GET /public_projects/1
    # GET /public_projects/1.xml
    def show
      @project = self.fetch_public_projects.find(params[:id])

      respond_to do |format|
        format.html
        format.js   { render :json => @project }
        format.xml  { render :xml => @project }
      end
    end

  end
end