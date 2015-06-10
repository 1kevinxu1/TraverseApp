class ImportCities < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE TABLE cities (
        zip integer DEFAULT NULL,
        state varchar(2) DEFAULT NULL,
        city varchar(16) DEFAULT NULL,
        lat decimal(8,6) DEFAULT NULL,
        lng decimal(10,6) DEFAULT NULL
      );

      COPY cities FROM '#{Dir.pwd}/db/cities.csv' DELIMITER ',' CSV;
    SQL
  end

  def down
    drop_table :cities
  end
end
