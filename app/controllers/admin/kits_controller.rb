class Admin::KitsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :all_kits, only: [:index, :create, :update, :destroy]
  before_action :set_kit, only: [:edit, :update, :destroy]
  respond_to :html, :js

  def index
    @kits = Kit.order(updated_at: :desc).page(params[:page])

    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @kit = Kit.friendly.find(params[:id])
    @templates = @kit.templates
  end

  def new
    @kit = Kit.new
  end

  def edit
    @kit = Kit.friendly.find(params[:id])
  end

  def create
    @kit = Kit.create(kit_params)
    if @kit.save
      redirect_to :action => :index
    else
      render 'new'
    end
  end

  def update
    @kit.update(kit_params)
  end

  def destroy
    @kit.destroy
  end

  private
    def all_kits
      @kits = Kit.order(:title).page(params[:page])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_kit
      @kit = Kit.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kit_params
      params.require(:kit).permit(:title, :cover_image)
    end
end
