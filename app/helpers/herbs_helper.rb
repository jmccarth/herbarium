module HerbsHelper
  
  def herb_image_tag(herb,photosize)
    if !herb.photo_file_name.nil?
      if root_path == "/"
		    image_tag herb.photo.url(photosize)
      else
        image_tag root_path + herb.photo.url(photosize)
      end
		else
      content_tag :small, "no image"
		end
  end
  
  def herb_image_search_url(herb)
    "http://www.google.com/images?q=" + herb.name
  end
  
  def herb_wikipedia_search_url(herb)
    "http://en.wikipedia.org/wiki/Special:Search/" + herb.name
  end
  
end
