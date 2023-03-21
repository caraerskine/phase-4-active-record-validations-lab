class Author < ApplicationRecord
    #author has a name
    validates :name, presence: true

    #no two authors have same name
    validates :name, uniqueness: true

    #author phone numbers are excalty  10 digits and is a #
    validates :phone_number, length: { is: 10 }, numericality: true
    


end
