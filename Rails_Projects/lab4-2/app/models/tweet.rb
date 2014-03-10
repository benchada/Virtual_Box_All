class Tweet < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessor	:status	
  belongs_to :zombie	

end
