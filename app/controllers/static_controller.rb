class StaticController < ApplicationController
	def cgu
	end

	def a_propos
	end

	def contact
		
	end

	def list
		if current_user.name == 'Admin' 
		else
			redirect_to root_path, notice: "Petit malin. Qu'essayez-vous de faire ?"	
		end
		@user = User.all.order(:id)
		@user_count = User.all.count
		@user_id = User.pluck(:id).to_s.tr('""', '')
		@user_email = User.pluck(:email).to_s.tr('""', '')
		@user_name = User.pluck(:name).to_s.tr('""', '')
	end

end
