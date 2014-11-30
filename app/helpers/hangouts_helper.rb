module HangoutsHelper
	def chat_length(start, finish)
		distance_of_time_in_words(start, finish).gsub('about ','')
	end
end
