module PublicView
  class ChangesetsController < BaseController

    before_filter :fetch_project

    def index
      scope = @project.changesets.scoped
      scope = scope.where('id <= ?', params[:to]) if params[:to]
      scope = scope.where('id > ?', params[:from]) if params[:from]
      @changesets = scope
      render :json => @changesets
    end

  end
end
