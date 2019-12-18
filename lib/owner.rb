require 'pry'
class Owner
  
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
   
  end

  def say_species
    return "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    return @@all.count
  end

  def self.reset_all
    return self.all.clear
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

    def dogs
      Dog.all.select do |dog|
        self == dog.owner
      end
    end

    def buy_cat(name)
      Cat.new(name,self)
    end

    def buy_dog(name)
      Dog.new(name,self)
    end

    def walk_dogs
      Dog.all.each do |doggie| #making each dog happy, iterate through dog array and make doggie happy
        doggie.mood = "happy"
      end
    end

    def feed_cats
      Cat.all.each do |kitty|
        kitty.mood = "happy"
      end
    end

    def sell_pets #added all cat and dog arrays into a new variable and iterated over it
      pets = Cat.all + Dog.all
      pets.each do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end
    end

    def list_pets
      return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."

    end


  



end