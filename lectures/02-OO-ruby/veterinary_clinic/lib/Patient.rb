# Add necessary Patient Class logic here! (See Activity.md)

class Patient
    attr_reader :id
    # def id
    #     @id
    # end

    # p1.patient_id = 5
    # def patient_id=(id)
    #     @id = id
    # end

    attr_accessor :name, :species, :age, :owner, :phone

    # consider initial value if @@all represents a collection of Patient instances
    @@all = []

    # private method => invoked via ".new"
    def initialize(id, name, species, age, owner, phone)
        # read only
        @id = id
        
        # read / write
        @name = name
        @species = species
        @age = age
        @owner = owner
        @phone = phone

        # self => new instance in question
        @@all << self
    end

    # Patient.all
    def self.all
        @@all
    end

    # Patient.empty?
    def self.empty?
        Patient.all.length == 0
    end

    # Custom Getter Method
    def give_name
        # @name
        self.name
    end

    # # Getter Method for Name
    # def get_name
    #     @name
    # end

    # # Setter Method for Name
    # def name=(name)
    #     @name = name
    # end

    # # Getter Method for Species
    # def species
    #     @name
    # end

    # # Setter Method for Species
    # def species=(species)
    #     @species = species
    # end
end