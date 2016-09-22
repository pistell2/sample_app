include HTTP

class StaticPagesController < ApplicationController
  def home
  	membershipType = System::XBOX
  	displayName = 'gmkryptonian'
  	puts HTTP.searchDestinyPlayer(membershipType, displayName)
  end

  def help
  end

  def about
  end

  def contact
  end
end

module System
	XBOX = 1
	PS = 2
end
