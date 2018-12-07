class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)

    binding.pry
    dont_capitalize = ['a','the','and','with']
    titlename = slug.split('-').map{|word| word.include?(dont_capitalize) ? word : word.titleize }.join(' ')
    self.find_by_name(titlename)
  end

end
