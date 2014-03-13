class Actor < ActiveRecord::Base
  has_many :actor_movie
  has_many :movies, through: :actor_movie

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
