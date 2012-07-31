class Question < ActiveRecord::Base
  attr_accessible :text, :responses_attributes
  
  has_many :responses,  :dependent => :destroy
  has_many :votes,      :dependent => :destroy
  
  accepts_nested_attributes_for :responses, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
  belongs_to :poll
end
