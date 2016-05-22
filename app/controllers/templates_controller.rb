class TemplatesController < ApplicationController

  def show
    @kit = Kit.friendly.find(params[:kit_id])
    @template = Template.friendly.find(params[:id])
    @last_front = @template.fronts.last
    @last_back = @template.backs.last
    @personalize = Personalize.new
  end

end
