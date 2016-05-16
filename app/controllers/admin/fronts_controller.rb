class Admin::FrontsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_kit, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_template, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_front, only: [:edit, :update,:destroy]
  respond_to :html, :js

  def new
    @front = Front.new
  end

  def create
    @front = Front.create(front_params)
    if @front.save
      redirect_to edit_admin_kit_template_path(@kit, @template)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @front.update(front_params)
    redirect_to edit_admin_kit_template_path(@kit, @template)
  end


  def destroy
    @front.destroy
    redirect_to edit_admin_kit_template_path(@kit, @template)
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_front
      @front = Front.find(params[:id])
    end

    def set_kit
      @kit = Kit.friendly.find(params[:kit_id])
    end

    def set_template
      @template = Template.friendly.find(params[:template_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def front_params
      params.require(:front).permit(:template_id, :image)
    end
end


