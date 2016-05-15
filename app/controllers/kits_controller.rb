class KitsController < ApplicationController
  def index
    @kits = Kit.order(:title).page(params[:page])
  end

  def show
    @kit = Kit.friendly.find(params[:id])
    @templates = @kit.templates.order(:title).page(params[:page])
  end
end
