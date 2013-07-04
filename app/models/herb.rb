class Herb < ActiveRecord::Base
  
  attr_accessible :name, :family, :genus, :species, :author, :comments, :photo
  has_attached_file :photo

  def self.search(search)  
      if search  
        where('name LIKE ?', "%#{search}%")  
      else  
        scoped  
      end  
  end
  
end