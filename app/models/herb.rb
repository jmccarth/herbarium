class Herb < ActiveRecord::Base
  
  attr_accessible :name
  has_attached_file :photo

  def self.search(search)  
      if search  
        where('name LIKE ?', "%#{search}%")  
      else  
        scoped  
      end  
  end
  
end