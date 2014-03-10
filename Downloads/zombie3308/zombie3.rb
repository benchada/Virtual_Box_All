class Zombie < ActiveRecord::Base
	attr_accessor :name, :tweets
	attr_accessible :name, :tweets
	validates :name, presence: true  
	has_many :weapons
	def initialize (attributes = nil)
		super(attributes)
		@name = 'Ash'
	end
end
