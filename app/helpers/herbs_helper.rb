require 'searchbing'
module HerbsHelper
  
  def herb_image_tag(herb,photosize)
    if !herb.photo_file_name.nil?
		  image_tag herb.photo.url(photosize)
		else
      bing_image = Bing.new("6SxyluY2vlb5Z+rb5qyBtdewoIXroEYdmMkwaQEtU78=",1,"Image")
      search_term = herb.genus + " " + herb.species
      bing_results = bing_image.search(search_term)
      image_tag bing_results[0]["Image"][0]["MediaUrl"]
      #content_tag :small, "no image"
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
