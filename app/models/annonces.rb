class Annonces < ActiveRecord::Base

    validates :titre, presence: true,
                    length: { minimum: 5 }

    mount_uploader :image, ImageUploader
    
    validates :category_id, presence: true

    belongs_to :categories
    belongs_to :user

    validates :cgu,  :acceptance => {:accept => true}
    
	 def  self.search(search)
   		where("titre LIKE ?", "%#{search}%") 
  		where("description LIKE ?", "%#{search}%")
  	end

end
