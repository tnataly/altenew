class Admin::SamplesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_kit, only: [:new, :create, :destroy]
  before_action :set_template, only: [:new, :create, :destroy]
  before_action :set_sample, only: [:destroy]
  respond_to :html, :js

  def new
    @sample = Sample.new
  end

  def create
    @sample = Sample.create(sample_params)
    if @sample.save
      redirect_to edit_admin_kit_template_path(@kit, @template)
    else
      render 'new'
    end
  end


  def destroy
    @sample.destroy
    redirect_to edit_admin_kit_template_path(@kit, @template)
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_sample
      @sample = Sample.find(params[:id])
    end

    def set_kit
      @kit = Kit.friendly.find(params[:kit_id])
    end

    def set_template
      @template = Template.friendly.find(params[:template_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sample_params
      params.require(:sample).permit(:template_id, :image)
    end
end
