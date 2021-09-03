class Book < ActiveRecord::Base
  belongs_to :author

  # def self.search(term)
  #   self.where("lower(title) LIKE ?", "%#{ term.downcase }%")
  # end
end