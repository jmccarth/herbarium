module HerbsHelper
  
  def herb_image_tag(herb)
    if !herb.photo_file_name.nil?
		  image_tag herb.photo.url, :width => "200"
		else
      content_tag :small, "no image"
		end
  end
  
end
