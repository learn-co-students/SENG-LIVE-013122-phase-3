class Appointment < ActiveRecord::Base
    belongs_to :patient
    belongs_to :vet

    # Activity 1 => Building Aggregate Class / Instance Methods

    # Class Methods

    # Return earliest appointment
    # Appointment.earliest
    def self.earliest
        # binding.pry  
        
        # Return Entire Appointment Instance
        # self.order(:date).first

        # Return Date of Earliest Appointment Instance
        self.all.minimum(:date)
    end

    # Return latest appointment
    def self.latest
        # binding.pry  

        # Return Entire Appointment Instance
        # self.order(:date).last

        # Return Date of Earliest Appointment Instance
        self.all.maximum(:date)
    end
    
    # Instance Methods
    
    # Return appointment patient's name
    def get_patient_name
        # binding.pry
        self.patient.name
    end

    # Return appointment vet's name
    def get_vet_name
        # binding.pry
        self.vet.vet_name
    end
end