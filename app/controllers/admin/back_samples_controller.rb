class Admin::BackSamplesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_kit, only: [:new, :create, :destroy]
  before_action :set_template, only: [:new, :create, :destroy]
  before_action :set_back_sample, only: [:destroy]
  respond_to :html, :js

  def new
    @back_sample = BackSample.new
  end

  def create
    @back_sample = BackSample.create(back_sample_params)
    if @back_sample.save
      redirect_to edit_admin_kit_template_path(@kit, @template)
    else
      render 'new'
    end
  end


  def destroy
    @back_sample.destroy
    redirect_to edit_admin_kit_template_path(@kit, @template)
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_back_sample
      @back_sample = BackSample.find(params[:id])
    end

    def set_kit
      @kit = Kit.friendly.find(params[:kit_id])
    end

    def set_template
      @template = Template.friendly.find(params[:template_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def back_sample_params
      params.require(:back_sample).permit(:template_id, :image)
    end
end
