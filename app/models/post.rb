class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    
    def self.search(keyword)
        where(["titles like? OR receipes like?", "%#{keyword}%", "%#{keyword}%"])
    end
    
end
