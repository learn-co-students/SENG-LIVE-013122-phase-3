# Create => CREATE TABLE, INSERT INTO

    # - initialize (.new) => Creates objects in memory
        
        # new_patient = Patient.new(...)  
    
    # - save (.save) => Persist objects to DB

    # - create => Both instantiate + save new class instances to DB

# Read => SELECT * FROM patients;

    # - .all => Patient.all => Retrieves all patients from DB

# Update => ALTER

# Destroy => DROP, DELETE


class PatientORM
    attr_reader :id
    attr_accessor :name, :age, :owner, :number, :species
    
    def self.create_table 
        
        # For strings that will take up multiple lines in your text editor, 
        # use a heredoc (https://blog.saeloun.com/2020/04/08/heredoc-in-ruby-and-rails.html) to create a string that 
        # runs on to multiple lines.
        sql = <<-SQL
        CREATE TABLE IF NOT EXISTS patients (
            id INTEGER PRIMARY KEY,
            clinic_id INTEGER,
            species TEXT,
            name TEXT,
            age INTEGER,
            owner TEXT,
            number TEXT
        );
        SQL
        DB.execute(sql)
    end 

    # Will this create a new record in DB or not?
    # PatientORM.new(...)
    def initialize(attributes) 
        # ACTIVITY 1 => Use mass assignment to allow attributes to be 
        # passed into initialize() as group of key / value pairs

        # Use Rake Console Test Case:
        # PatientORM.new(name: "Grace", age: 1, owner: "Sally", number: "222-222-2222", species: "Cat")

        # method hints => ".each", ".respond_to?", ".send"
        # https://apidock.com/ruby/Object/respond_to%3F
        # https://apidock.com/ruby/Object/send

        # iterate over passed in attributes
        attributes.each do |key, value|

            # check whether setter exists for attribute
            # "#{key.to_s}=" => "name=" vs. "name"
            if self.respond_to?("#{key}=")
                
                # "send" key / value pairing
                # self.key = value => syntactic sugar
                self.send("#{key}=", value) # syntactic vinegar
            end
        end
    end

    # new_patient = PatientORM.new(name: "Grace", age: 1, owner: "Sally", number: 2, species: "Cat")
    # new_patient.save
    def save
        # For strings that will take up multiple lines in your text editor, 
        # use a heredoc (https://blog.saeloun.com/2020/04/08/heredoc-in-ruby-and-rails.html) 
        # to create a string that runs on to multiple lines.
        sql = <<-SQL
        INSERT INTO patients (species, name, age, owner, number) VALUES (?,?,?,?,?);        
        SQL
        
        # ACTIVITY 1 => Use "execute" and "last_insert_row_id" to add new
        # PatientORM class instances to DB with appropriate IDs
        # https://www.rubydoc.info/github/luislavena/sqlite3-ruby/SQLite3/Database#execute-instance_method
        # https://www.rubydoc.info/github/luislavena/sqlite3-ruby/SQLite3%2FDatabase:last_insert_row_id

        DB.execute(sql, self.species, self.name, self.age, self.owner, self.number)
        @id = DB.last_insert_row_id

        # NOTE => Remember to return "self" instance
        # Confirmation of new PatientORM instance
        self
    end

    def self.create(args)
        # ACTIVITY 2 => Use "new" and "save" to simultaneously 
        # create / add new PatientORM class instances to DB

        # Instantiate the PatientORM class
        new_patient = self.new(args)

        # Save the new instance to our DB
        new_patient.save

        # NOTE => Remember to return "patient" instance
        new_patient
    end

    def self.all 
        # ACTIVITY 2 => Use "DB.execute()" + SQL to retrieve all 
        # patients from table.
        
        # HINT => Use ".map" and "self.new" to create an array of "mapped_resources"

        # NOTE => Remember to return "mapped_resources" as an iterable list
        # of patients

        # Use DB.execute + SQL to retrieve all patients
        patients = DB.execute("SELECT * FROM patients")

        mapped_resources = patients.map do |patient|
            self.new(patient)
        end
    end
end 