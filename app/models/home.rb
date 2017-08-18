class Home < ActiveRecord::Base
    def self.search(search)
        # Community.search(search)
        # Alba.search(search)
        # Tippost.search(search)
        # Community.where('title LIKE ? OR content  LIKE ?',"%#{search}%","%#{search}%")
        # Alba.where('title LIKE ? OR content  LIKE ?',"%#{search}%","%#{search}%")
        # Tippost.where('title LIKE ? OR content  LIKE ?',"%#{search}%","%#{search}%")

  end       
  

    
end
