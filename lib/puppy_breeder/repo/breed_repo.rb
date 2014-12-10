class BreedRepo
  def initialize
    @db = PG.connect(dbname: 'my-first-db')
    command = <<-SQL
    CREATE TABLE IF NOT EXISTS breeds(
      id SERIAL,
      name TEXT,
      price INTEGER,
      PRIMARY KEY( id )
    );
    SQL
    @db.exec(command)
  end

  def clear_table
    command = <<-SQL
    TRUNCATE breeds;
    SQL
    @db.exec(command)
  end

  def set_breed_price(name, price)
    # Search for breed with the name
    # If it exists, update the price
    # If it doesn't exist, create new record
    
    if get_breed(name).nil?
      command = <<-SQL
      INSERT INTO breeds(name, price)
      VALUES ('#{name}', '#{price}')
      RETURNING *;
      SQL

      result = @db.exec(command)
      convert_to_breed(result.values)
    else
      command = <<-SQL
      UPDATE breeds
      SET price = '#{price}'
      WHERE name = '#{name}'
      RETURNING *;
      SQL

      result = @db.exec(command)
      convert_to_breed(result.values)
    end
  end

  def get_breed(name)
    command = <<-SQL
    SELECT * FROM breeds
    WHERE name='#{name}';
    SQL

    result = @db.exec(command)
    convert_to_breed(result.values)
  end

  def convert_to_breed(data)
    if data.any?
      Breed.new(data[0][0], data[0][1], data[0][2].to_i)
    end
  end
end