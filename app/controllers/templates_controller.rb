class TemplatesController < ApplicationController

  def show
    @kit = Kit.friendly.find(params[:kit_id])
    @template = Template.friendly.find(params[:id])
    @last_front = @template.fronts.last
    @last_back = @template.backs.last
    @url = @last_front.image_url
    @test = Nokogiri::Slop(File.open(@url))
    #@test.xpath('//text').each do | text_node |
      #puts text_node.content
    #end
    @text_styles = @test.search('text').map(&:text)
    @personalize = Personalize.new
    @back_samples = @template.back_samples.order(updated_at: :desc).page(params[:page])
    @samples = @template.samples.order(updated_at: :desc).page(params[:page])
  end

end
