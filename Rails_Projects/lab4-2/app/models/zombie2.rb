class Zombie < ActiveRecord::Base
  validates :name, presence:true
  attr_accessor :name, :tweets
  attr_accessible :name, :tweets
  has_many :weapons
    def initialize( attributes = nil)
	super (attributes)
	weapons<< Weapons.new 
	weapons<< Weapon.new
    end
end
