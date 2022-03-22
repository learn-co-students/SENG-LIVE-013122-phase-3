class Vet < ActiveRecord::Base    
    has_many :appointments
    has_many :patients, through: :appointments

    # Class Methods

    # NoMethodError => Vet.all_vet_namez
    def self.all_vet_names
        self.pluck(:vet_name)
        
        # NameError
        # oops
    end

    def self.most_patients 
        # SyntaxError
        # self.all.max{ |v| v.patients.length 
        
        # binding.pry
        # self.all => All Vets
        # self.all.first => First Vet
        # self.all.first.patients => Collection of First Vet's Patients
        # self.all.first.patients.length => Length of Collection
        
        self.all.max{ |v| v.patients.length }
    end 

    # Instance Methods

    # def some_method
    
    # end

    def find_old_patients
        # TypeError
        # self.patients.sample("age > 9")
        # https://apidock.com/ruby/v2_5_5/Array/sample
        
        self.patients.where("age > 9")
    end

    # ArgumentError
    # firstVet = Vet.first
    # firstVet.list_names_and_numbers("name", "phone")
    def list_names_and_numbers
        self.patients.pluck(:name, :phone)
    end
    
    def find_oldest_patient
        self.patients.maximum(:age)
    end 
end 