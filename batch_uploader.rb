def image_uploader
	# Batch herbarium image uploader
	Dir.foreach("/home/jmccarth/testimg") do |file_name|
		if file_name != "." && file_name != ".."
			#Get herb ID from file name by searching for the first underscore and taking the number in front of it
			herb_id = file_name.split("_")[0]
			puts "Uploading " + herb_id
			the_herb = Herb.find(herb_id)
			the_image = File.open("/home/jmccarth/testimg/" + file_name)
			the_herb.photo = the_image
			the_image.close
			the_herb.save!
		end
	end
end