module HangoutsHelper
	def chat_length(start, finish)
		distance_of_time_in_words(start, finish).gsub('about ','')
	end

	def is_live(start, finish)
		start.to_s <= Time.zone.now.to_s && finish.to_s >= Time.zone.now.to_s
	end

	def is_planned(start)
		start.to_s > Time.zone.now.to_s
	end
end
