class AnnoncesController < ApplicationController
	before_action :find_annonce, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]


	def index
		if params[:categories].blank?
			@annonces = Annonces.all.order("created_at DESC")
		else
			@category_id = Categories.find_by(name: params[:categories]).id
			@annonces = Annonces.where(category_id: @category_id).order("created_at DESC")
		end

		if params[:search]
			@annonces = Annonces.search(params[:search]).order("created_at DESC")
		end
	end

	def show
		#Montrer la catégorie et la ville dans la page de l'annonce
		@categorie = Categories.where(id: @annonce.category_id).pluck(:name)
		@categorie = @categorie.to_s
		@categorie = @categorie.tr('[]', '')
		@categorie = @categorie.tr('""', '')

		@ville = Ville.where(id: @annonce.ville_id).pluck(:nom_ville)
		@ville = @ville.to_s
		@ville = @ville.tr('[]', '')
		@ville = @ville.tr('""', '')

		@user_name = User.where(id: @annonce.user_id).pluck(:name)
		@user_name_string = @user_name.to_s
		@user_name_string = @user_name_string.tr('[]', '')
		@user_name_string = @user_name_string.tr('""', '')
	end

	def new
		@annonce = Annonces.new
	end

	def create
		@annonce = Annonces.new(annonce_params)
		@annonce.user_id = current_user.id
		if @annonce.save
			redirect_to @annonce, notice: "Annonce crée avec succès !"
		else
			render 'new', notice: "Oups ! Une erreur s'est produite..."
		end
	end

	def edit
		if @annonce.user_id == current_user.id
		else
			redirect_to @annonce, notice: "Petit malin. Qu'essayez-vous de faire ?"	
		end
	end

	def update
		if @annonce.update(annonce_params)
			redirect_to @annonce
		else
			render "edit"
		end
	end

	def destroy
		@annonce.destroy
		redirect_to annonces_path, notice: "Annonce supprimée"
	end

	private 
		def annonce_params
			params.require(:annonce).permit(:titre, :description, :image, :telephone, :ville, :ecole, :category_id, :user_id, :cgu)
		end

	private
		def find_annonce
			@annonce = Annonces.find(params[:id])
		end

end