module PortfoliosHelper
  def image_generator(height:, width:)
   "http://placehold.it/#{height}x#{width}"
  end

  def portfolio_img img, img_type
    if img.model.image? || img.model.thumb_image?
      img
    elsif img_type =='thumb'
      image_generator(height: '350', width: '200')
    else 
      image_generator(height: '600', width: '400')
    end
  end 
end
