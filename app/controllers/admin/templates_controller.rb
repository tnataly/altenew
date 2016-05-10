class Admin::TemplatesController < ApplicationController

  def index
    @templates = Template.order(:title).page(params[:page])
  end

  def new
    @template = Template.new
  end

  def edit
    @template = Template.friendly.find(params[:id])
  end

  def create
    @template = Template.new(template_params)
    respond_to do |format|
      if @template.save
        format.html { redirect_to admin_templates_path }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @template = Template.friendly.find(params[:id])
    @template.update(template_params)
    respond_to do |format|
      if @template.save
        format.html { redirect_to admins_templates_path }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @template = Template.friendly.find(params[:id])

    respond_to do |format|
      if @template.destroy
        format.html { redirect_to admins_templates_path }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_params
      params.require(:template).permit(:title, :size, :cover_image)
    end
end
