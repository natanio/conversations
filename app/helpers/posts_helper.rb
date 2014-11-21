module PostsHelper
	def tag_links(tags)
  		tags.split(",").map{|tag| link_to tag.strip, language_hangout_tag_path(@language, @hangout, tag.strip) }.join(", ") 
	end

	def tag_cloud(tags, classes)
  		max = tags.sort_by(&:count).last
  		tags.each do |tag|
    		index = tag.count.to_f / max.count * (classes.size-1)
    		yield(tag, classes[index.round])
  		end
	end
end