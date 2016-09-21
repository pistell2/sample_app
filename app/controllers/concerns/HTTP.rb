require 'net/http'
require 'json'

module HTTP

	  # searchDestinyPlayer returns Hash of:
  	# 	iconPath (Xbox or Playstation Logo)
  	# 	membershipType (Xbox:1 or Playstation:2)
  	# 	membershipId (Destiny membershipID)
  	# 	displayName (gamertag with proper formatting)
	def searchDestinyPlayer(membershipType, displayName)
		# Break up to be only hostname & then list paths as
  	uri = URI("https://www.bungie.net/Platform/Destiny/SearchDestinyPlayer/#{membershipType}/#{displayName}/")
  	
  	Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
  		req = Net::HTTP::Get.new(uri)
  		req.add_field 'X-API-Key', '8e99962ee3bb4de498efcc507102286f'

  		response = http.request(req)
  		# Handle Error (301 Redirect / 404 Page Not Found)
  		body = JSON.parse(response.body).with_indifferent_access
  		return membershipId = body[:Response].first
  	end
	end

end