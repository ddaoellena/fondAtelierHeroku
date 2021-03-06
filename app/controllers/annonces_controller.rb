	class AnnoncesController < ApplicationController
	before_action :find_annonce, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]


	def index
		@check_annonce = Annonces.any?

	#filtrer la catégorie et le type de transaction

		if params[:categories].blank?
			@annonces = Annonces.all.order("created_at DESC")
		else
			@category_id = Categories.find_by(name: params[:categories]).id
			@annonces = Annonces.where(category_id: @category_id).order("created_at DESC")
		end

		if params[:type].blank?
			@annonces = Annonces.all.order("created_at DESC")
		else
			@type_id = Type.find_by(name: params[:type]).id
			@annonces = Annonces.where(type_id: @type_id).order("created_at DESC")
		end

	#barre de recherche
	
		if params[:search]
			@annonces = Annonces.search(params[:search]).order("created_at DESC")
		end
	end

	def show
		#Montrer la catégorie, la ville et le pseudo de l'annonceur dans la page de l'annonce
		@categorie = Categories.where(id: @annonce.category_id).pluck(:name)
		@categorie = @categorie.to_s
		@categorie = @categorie.tr('[]', '')
		@categorie = @categorie.tr('""', '')

		@type = Type.where(id: @annonce.type_id).pluck(:name)
		@type = @type.to_s
		@type = @type.tr('[]', '')
		@type = @type.tr('""', '')

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
			redirect_to @annonce, notice: "Annonce créée avec succès !"
		else
			render 'new', notice: "Oups ! Une erreur s'est produite..."
		end
	end

	def edit
		if @annonce.user_id == current_user.id || current_user.name == 'Admin'
		else
			redirect_to @annonce, notice: "Petit malin. Qu'essayez-vous de faire ?"	
		end
	end

	def update
		@annonce = Annonces.find(params[:id])

		if @annonce.update(annonce_params)
			redirect_to @annonce, notice: "Annonce éditée avec succès !"
		else
			render 'edit'
		end
	end

	def destroy
		if @annonce.user_id == current_user.id || current_user.name == 'Admin'
			@annonce.destroy
			redirect_to annonces_path, notice: "Annonce supprimée"
		else
			redirect_to @annonce, notice: "Petit malin. Qu'essayez-vous de faire ?"	
		end
	end

	private 
		def annonce_params
			params.require(:annonce).permit(:id, :titre, :description, :image, :telephone, :category_id, :user_id, :cgu, :type_id, :ville_id)
		end

	private
		def find_annonce
			@annonce = Annonces.find(params[:id])
		end

end