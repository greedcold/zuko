class Listing < ActiveRecord::Base

if Rails.env.development?
 # has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.png",
#else
	has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.png",
 	                  :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
								    #:path => ":style/:id_:filename"
end
validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png)  # проверка контента(картинки) на соответствие формату
belongs_to :user
has_many :orders

  def self.search(search)
    if search
      self.where("name like ?", "%#{search}%")
    else
      self.all
    end
  end
end
