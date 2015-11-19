class StaticController < ApplicationController
	def cgu
	end

	def a_propos
	end

	def contact
		
	end

	def list
		@user = User.pluck(:email).to_s.tr('""', '')
	end

end
