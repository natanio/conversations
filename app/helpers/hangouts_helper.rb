module HangoutsHelper
	def chat_length(start, finish)
		@l = (finish - start) / 3600
		if @l < 2
			"#{@l.to_s} hour"
		else
			"#{@l.to_s} hours"
		end
	end
end
