def image_uploader
	# Batch herbarium image uploader
	Dir.foreach("/home/jmccarth/testimg") do |file_name|
		if file_name != "." && file_name != ".."
			#Get herb ID from file name by searching for the first underscore and taking the number in front of it
			herb_id = file_name.split("_")[0]
			puts "Uploading " + herb_id
            if Herb.exists?(herb_id)
                the_herb = Herb.find(herb_id)
                the_image = File.open("/home/jmccarth/testimg/" + file_name)
                the_herb.photo = the_image
                the_image.close
                #This block may cause problems if there is an image corruption issue
                begin
                    the_herb.save!
                rescue ActiveRecord::RecordInvalid
                    # Caused by underlying Paperclip::Errors::NotIdentifiedByImageMagickError
                    $stderr.print "Error saving " + herb_id + " due to ImageMagick error"
                end
            end
		end
	end
end

def check_for_photos
        directory = "/home/jmccarth"
        File.open(File.join(directory,"images.csv"),"w") do |f|
                Herb.all.each do |h|
                        record = h.id.to_s + "," + h.name + ","
                        if h.photo_file_name.nil?
                                record += "nil,"
                        else
                                record += ","
                        end

                        if h.photo_file_name.nil?
                                record += ","
                        else
                                if h.photo_updated_at < 1.week.ago
                                        record += "old,"
                                else
                                        record += "new,"
                                end
                        end

                        f.puts record
                end
        end
end
