module HangoutsHelper
	def chat_length(start, finish)
		distance_of_time_in_words(start, finish).gsub('about ','')
	end

	def time_to_end(finish)
		distance_of_time_in_words(Time.now, finish)
	end

	def is_live(start, finish)
		start.to_s <= Time.zone.now.to_s && finish.to_s >= Time.zone.now.to_s
	end

	def is_finished(finish)
		finish.to_s <= Time.zone.now.to_s
	end

	def is_planned(start)
		start.to_s > Time.zone.now.to_s
	end

	def rsvp_count(hangout)
		Rsvp.where(rsvped_id: hangout.id).count
	end
end
