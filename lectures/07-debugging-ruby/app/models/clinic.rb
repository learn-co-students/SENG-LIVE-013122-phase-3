class Clinic < ActiveRecord::Base
    has_many :patients, dependent: :destroy

    # Activity 1 => Building Aggregate Class / Instance Methods

    # Class Methods

    # Return all clinic names
    def self.all_clinic_names
        self.pluck(:clinic_name)
    end

    # Return total number of clinics
    def self.clinic_count
        self.count
        # all_clinics = self.all
        # all_clinics.length
    end

    # Return clinic with least number of patients
    def self.least_patients
        # Set up high view of Class instances
        # clinics = self.all

        self.all.min_by { |c| c.patients.length }
    end

    # Instance Methods

    # Return clinic's total number of patients
    def patient_count
        self.patients.length
    end

    # Return clinic's patient names
    def patient_names
        self.patients.pluck(:name)
    end
end