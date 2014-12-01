module HangoutsHelper
	def chat_length(start, finish)
		distance_of_time_in_words(start, finish).gsub('about ','')
	end

	def is_live(start, finish)
		if (start >= Time.now) && (finish <= Time.now )
			return true
		else
			return false
		end
	end

	def is_planned(start, finish)
		if start < Time.now
			return true
		else
			return false
		end
	end
end
