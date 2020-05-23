class DOG 
  
  attr_accessor :id, :name, :breed 
  
  def initialize(attributes)
    attributes.each { |key, value| self.send(("#{key}="), value)}
    self.id ||= nil 
  end
  
  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
      )
    SQL
    
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = "DROP TABLE dogs";
    DB[:conn].execute(sql)
  end
  
  def save
    sql = <<-SQL
      INSERT INTO dogs (name, breed) 
      VALUES (?, ?)
    SQL
    
    DB[:conn].execute(sql, self.name, self.breed)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
  end
  
  def self.create(hash_of_attributes)
    dog = self.new(hash_of_attributes)
    
    
    
  
  
  
  
  
end