class Herb < ActiveRecord::Base
  
  attr_accessible :name, :family, :genus, :species, :author, :comments, :photo, :folder
  has_attached_file :photo, :styles => { :medium => "500x", :thumb => "150x" }

  def self.search(search)  
      if search  
        where('name LIKE ? OR genus LIKE ? OR family LIKE ? OR species LIKE ?', "%#{search}%","%#{search}%","%#{search}%","%#{search}%")  
      else  
        scoped  
      end  
  end
  
  def self.record_view(herb)
    herb.increment!(:view_count)
  end
  
end