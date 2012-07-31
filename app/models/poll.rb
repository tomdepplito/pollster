class Poll < ActiveRecord::Base
  attr_accessible :title, :edit_url, :questions_attributes
  
  has_many :votes,      :dependent => :destroy 
  has_many :responses,  :dependent => :destroy
  has_many :questions,  :dependent => :destroy
  
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
  validates_uniqueness_of :edit_url
  
  #before_save :make_edit_url
  
  # def make_edit_url
  #   self.edit_url = (0...5).map{ (0..9).to_a[rand(10)].to_s+('a'..'z').to_a[rand(26)] }.join
  # end
end
