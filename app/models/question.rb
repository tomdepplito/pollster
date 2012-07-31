class Question < ActiveRecord::Base
  attr_accessible :content, :responses_attributes
  
  has_many :responses,  :dependent => :destroy
  has_many :votes,      :dependent => :destroy
  
  #accepts_nested_attributes_for :responses, :reject_if => lambda { |a| a[:text].blank? }, :allow_destroy => true
  
  belongs_to :poll
end
