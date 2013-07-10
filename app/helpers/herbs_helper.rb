module HerbsHelper
  
  def herb_image_tag(herb,photosize)
    if !herb.photo_file_name.nil?
		  image_tag herb.photo.url(photosize)
		else
      content_tag :small, "no image"
		end
  end
  
  def herb_image_search_url(herb)
    "http://www.google.com/images?q=" + herb.name
  end
  
end
