module PublicView
  class StoriesController < BaseController

    include ActionView::Helpers::TextHelper

    before_filter :fetch_project

    def index
      @stories = @project.stories
      render :json => @stories
    end

    def show
      @story = @project.stories.find(params[:id])
      render :json => @story
    end

    def done
      @stories = @project.stories.done
      render :json => @stories
    end

    def backlog
      @stories = @project.stories.backlog
      render :json => @stories
    end

    def in_progress
      @stories = @project.stories.in_progress
      render :json => @stories
    end

  end

end