class User < ActiveRecord::Base
  has_many :photos, dependent: :delete_all

  def self.recent
    order("created_at desc")
  end

  attr_accessor :age

  def age
    if !birthday.nil?
      age = Date.today.year - birthday.year
      age -= 1 if Date.today < birthday + age.years #for days before birthday
    end

  end

end
