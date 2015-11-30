class NewsController < ApplicationController

	before_action :find_news, only: [:show, :edit, :update, :destroy]

	def index
		@new = News.all.order("created_at DESC")
	end

	def new
		@new = News.new
	end

	def create
		@new = News.new(news_params)
		if @new.save
			redirect_to news_index_path, notice: "Article créé avec succès !"
		else
			render 'new', notice: "Oups ! Une erreur s'est produite..."
		end
	end


	def edit
	end

	def update
		if @new.update(news_params)
			redirect_to @new, notice: "Article éditée avec succès !"
		else
			render 'edit'
		end
	end

	def show
		
	end

	def destroy
		@new.destroy
		redirect_to news_index_path, notice: "Article supprimée"
	end

	private 
		def news_params
			params.require(:news).permit(:id, :titre, :contenu)
		end

	private
		def find_news
			@new = News.find(params[:id])
		end

end


