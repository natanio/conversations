module PostsHelper
	def tag_links(tags)
  		tags.split(",").map{|tag| link_to tag.strip, language_hangout_tag_path(@language, @hangout, tag.strip) }.join(", ") 
	end
end