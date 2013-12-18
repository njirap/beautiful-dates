require 'active_support/core_ext/integer/inflections'

module BeautifulDates
	extend self

	define_method("beautify") do
		beautify_date
	end

	def split_date date
		date.split(/\/|-|\./)
	end

	def datify_date
		date = split_date self
		Time.new(date[0].to_i, date[1].to_i, date[2].to_i)
	end

	def ordinalize_day date_time
		date_time.day.ordinalize
	end

	def new_date date, day
		date.sub(/\d{1,2}/, day)
	end

	def options_array date_time
		options = []
		day = ordinalize_day date_time

		option1 = new_date date_time.strftime("%d %B %Y"), day
		split_option1 = option1.split
		option2 = split_option1.insert(0, split_option1.delete_at(1)).insert(1, "the").join(" ")
		option1 = option1.split.insert(1, "of").join(" ")

		options << option1
		options << option2
		options
	end

	def beautify_date
		if self.class == Time
			options_array self
		else
			date_time = datify_date
			options_array date_time
		end
	end
end

String.send(:include, BeautifulDates)
Time.send(:include, BeautifulDates)