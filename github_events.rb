require 'httparty'
require 'json'

def get_data url
      response = HTTParty.get("https://api.github.com"+url)
      return JSON.parse(response.body)
end
def get_events_by_date(name,month)
	hash = {}
	old_date = ""
	data = get_data("/users/#{name}/events")
	data.each do |event|
		if event["type"] == "PushEvent" && event["created_at"][0..6] == "2013-#{month}"
			date=event["created_at"][0..9]
			hash[date] = [] if old_date[0..9] != date
			hash[date] << event["payload"]["commits"][0]["message"]
			old_date = event["created_at"]
		end
	end
	return hash
end

=begin

puts "Console application for gathering information about commits in days:"
puts
puts "#########################################"
puts "Your name:"
name = gets.chomp
puts "Month of report (01-12)"
month = gets.chomp
puts
get_events_by_date(name, month).each{|date,com| 
	puts date
	com.each{|mes| puts "  "+mes }
}

=end