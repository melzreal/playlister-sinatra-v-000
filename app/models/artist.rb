class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def self.slug 
    @slug = self.name.downcase.split("").join("-")
    @slug
  end 

  
  def self.find_by_slug(slug)
  end


  it "can slugify its name" do

    expect(@artist.slug).to eq("taylor-swift")
  end

  describe "Class methods" do
    it "given the slug can find an Artist" do
      slug = "taylor-swift"
      expect((Artist.find_by_slug(slug)).name).to eq("Taylor Swift")
    end
  end

  
end
