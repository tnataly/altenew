class TemplatesController < ApplicationController
  def index
    @templates = Template.order(:title).page(params[:page])
  end
end
