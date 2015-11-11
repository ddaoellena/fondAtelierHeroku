class MesAnnoncesController < ApplicationController
	def index
		@my_id = current_user.id
		@my_annonces = Annonces.where(user_id: @my_id).order("created_at DESC")
	end
end
