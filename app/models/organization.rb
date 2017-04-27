#encoding:utf-8

class Organization < ApplicationRecord
  has_many :subordinates, :class_name => "Organization", :foreign_key => "superior_id"
  belongs_to :superior, :class_name => "Organization"
  has_many :users
  validates :code, :name, presence: true
  validates :code, :name, uniqueness: true
  
  def superior_name 
    superior ? superior.name : ""
  end

  def self.default
    Organization.find(1)
  end

  def self.nil_object
    Organization.new
  end

  # include self
  def subtree_ids
    org_ids = []
    org_ids << self.id
    subs = self.subordinates
    if subs
      subs.each do |o|
        org_ids << o.subtree_ids
      end
    end
    org_ids
  end

  def self_sons_ids
    org_ids = []
    org_ids << self.id
    subs = self.subordinates
    if subs
      subs.each do |o|
        org_ids << o.id
      end
    end
    org_ids
  end
end
