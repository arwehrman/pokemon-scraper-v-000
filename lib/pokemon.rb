class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp:60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    new_pokemon_object = db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", [id]).flatten
		Pokemon.new(id:new_pokemon_object[0], name:new_pokemon_object[1], type:new_pokemon_object[2], hp:new_pokemon_object[3], db: db)
  end

  def alter_hp(hp, db)
		db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)
	end
end
