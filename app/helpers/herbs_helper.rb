module HerbsHelper
  
  def herb_image_tag(herb,photosize)
    if !herb.photo_file_name.nil?
		  image_tag herb.photo.url(photosize)
		else
      content_tag :small, "no image"
		end
  end

  def herb_image_url(herb,photosize)
    if !herb.photo_file_name.nil?
      if root_path == "/"
        herb.photo.url(photosize)
      else
        root_path + herb.photo.url(photosize)
      end
    end
  end
  
  def herb_image_search_url(herb)
    "http://www.google.com/images?q=" + herb.genus + "+" + herb.species
  end
  
  def herb_wikipedia_search_url(herb)
    "http://en.wikipedia.org/wiki/Special:Search/" + herb.genus + " " + herb.species
  end
  
end
