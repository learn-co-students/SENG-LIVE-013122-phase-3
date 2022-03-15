# Use "require" for installed gems (require 'pry')
# Use "require_relative" for local files (require_relative './Patient')

# $patients = [
#     { id: 1, species:"dog", age: 1, name:"Jack", owner:"John Smith", phone: "999-999-9999"},
#     { id: 2, species:"bird", age: 3, name:"Mia", owner:"Jane Doe", phone: "888-888-8888"},
#     { id: 3, species:"cat", age: 5, name:"Grace", owner:"Louis", phone: "777-777-7777"}
# ]

$clinics = [
    { id: 1, clinic_name: "Flatiron Veterinary Clinic", address: "111 Hacker Way", phone: "777-777-7777"},
    { id: 2, clinic_name: "Bakersville Veterinary Clinic", address: "222 Hyde Street", phone: "666-666-6666"},
    { id: 3, clinic_name: "Pets R Us", address: "333 Animal Way", phone: "555-555-5555"}
]

# Strings for formatting out, multiple variable assignmentreduces lines of code
$single_line, $double_line, $horizontal_rule = "\n", "\n\n", "-----------------------"

def initialize_app
    # binding.pry
    menu
end

# separation of concerns, wrapping tasks into clear functions
def menu

    puts $single_line + "Welcome to Flatiron Veterinary Clinic!" + $double_line
    puts "Please choose an option:" + $double_line
    puts "1. List All Patients"
    puts "2. List All Clinics"
    puts "3. List Patient Species"
    puts "4. List Clinic Names"
    puts "5. Add New Patient"
    puts "0. Exit" + $double_line

    # initial user input prompt, "print" does not add new line, "puts" does
    print "Enter Your Prompt: "
    user_input = gets.strip

    puts $horizontal_rule

    # Case Statement => Better for Numerous Options / Easily Scalable
    case user_input

    when "5"
        create_patient
        
        # recursive method call
        menu
    when "4"
        # .map returns an Array
        clinics_array = $clinics.map{|clinic| clinic[:clinic_name]}
        puts clinics_array

        # recursive method call
        menu
    when "3"
        # .map returns an Array
        if !Patient.empty?
            patient_species = Patient.all.map{|patient| patient.species}
            puts patient_species
        else
            puts "No Patients!"
        end

        # recursive method call
        menu
    when "2"
        # iterate over $clinics (array of hash objects)
        $clinics.each { |clinic| puts clinic }
        
        # recursive method call
        menu
    when "1"
        # old approach => iterate over $patients (array of hash objects)
        # $patients.each { |patient| puts patient }
        
        # invoke self.all Patient class method to return @@all
        patients = Patient.all

        # See "self.empty?" in "Patient.rb"
        if !Patient.empty?

            # iterate over @@all and "get" attributes
            Patient.all.each { |patient| 
                puts "ID: #{patient.id}" 
                puts "Species: #{patient.species}" 
                puts "Age: #{patient.age}"
                puts "Name: #{patient.name}"
                puts "Owner: #{patient.owner}"
                puts "Phone: #{patient.phone}"
                puts $single_line
            }
        else
            puts "No Patients!"
        end

        # recursive method call
        menu
    when "0"
        puts "Goodbye!"
    else
        puts "Please enter a valid integer (0 - 5)"

        # recursive method call
        menu
    end
end

def create_patient
    puts "What's the species?"
    new_species = gets.strip
    puts "What's the age?"
    new_age = gets.strip
    puts "What's the name?"
    new_name = gets.strip
    puts "Who's the owner?"
    new_owner = gets.strip
    puts "What's the owner's phone number?"
    new_phone = gets.strip

    # old way => create hash literal for each new_patient, offers 
    # no clear bundling of patient data other than as an array of 
    # hash objects

        # new_patient = {
        #     id: $patients.length + 1,
        #     species: new_species,
        #     name: new_name,
        #     owner: new_owner,
        #     phone: new_phone
        # }

        # add ("shovel") new_patient to $patients 
        # $patients << p1

        # output updated list of $patients
        # puts $patients

    # new way => creating / storing new instances within Patient class (@@all)
    # helps us to interact with our data in more dynamic / powerful ways
    # through instance methods, class methods, etc.

    new_id = Patient.all.length + 1

    new_patient = Patient.new(
        new_id,
        new_species, 
        new_age, 
        new_name,
        new_owner,
        new_phone
    );
    

    # To confirm, output newly added patient's name
    puts $horizontal_rule
    puts "New Patient Created! Welcome, #{new_patient.name}."
end