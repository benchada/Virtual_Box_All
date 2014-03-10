class Weapon < ActiveRecord::Base
   #attr_accessible :title, :body
   attr_accessor :name
   belongs_to :zombie

end
