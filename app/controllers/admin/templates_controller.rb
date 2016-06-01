class Admin::TemplatesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:new, :create]
  before_action :set_kit, only: [:index, :edit, :new, :create, :update, :destroy]
  before_action :set_template, only: [:edit, :update, :destroy]
  before_action :all_samples, only: [:edit]
  before_action :all_back_samples, only: [:edit]
  before_action :set_front, only: [:edit]
  before_action :set_back, only: [:edit]
  respond_to :html, :js

  def index
    @templates = @kit.templates.order(:title).page(params[:page])
  end

  def new
    @template = Template.new
  end

  def edit
    @sample = Sample.new
    @back_sample = Sample.new
    @front = Front.new
    @back = Back.new
  end

  def create
    @template = Template.new(template_params)
    respond_to do |format|
      if @template.save
        format.html { redirect_to admin_kit_templates_path(@kit) }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @template.update(template_params)
    respond_to do |format|
      if @template.save
        format.html { redirect_to admin_kit_templates_path(@kit) }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @template.destroy
        format.html { redirect_to admin_kit_templates_path(@kit) }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = Template.friendly.find(params[:id])
    end

    def set_kit
      @kit = Kit.friendly.find(params[:kit_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_params
      params.require(:template).permit(:title, :size, :cover_image, :kit_id)
    end

    def all_samples
      @samples = @template.samples.order(updated_at: :desc).page(params[:page])
    end

    def all_back_samples
      @back_samples = @template.back_samples.order(updated_at: :desc).page(params[:page])
    end

    def set_front
      @last_front = @template.fronts.last
    end

    def set_back
      @last_back = @template.backs.last
    end
end
