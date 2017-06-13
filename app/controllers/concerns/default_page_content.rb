module DefaultPageContent
  extend ActiveSupport::Concern
  included do 
    before_action :set_page_defaults 
  end 

  def set_page_defaults 
    @page_title = "Zacks Rails Example"
    @seo_keywords = "Blog, Rails, development"
  end

end 