//
//  Data.swift
//  Amusement Park Pass Generator P1
//
//  Created by Mark Erickson on 8/3/18.
//  Copyright © 2018 Mark Erickson. All rights reserved.
//

import Foundation

struct EntrantData {
    
    // Uncomment below to test different entrant types
    
    //let entrant = ClassicGuest()
    let entrant = VIPGuest()
    //let entrant = FreeChildGuest(personalInfo: PersonalInfo(dateOfBirth: "01/01/2015", ssn: nil, firstName: nil, lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil))
    //let entrant = FoodServicesEmployee(personalInfo: PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: "10101"))
    //let entrant = RideServicesEmployee(personalInfo: PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: "10101"))
    //let entrant = MaintenanceEmployee(personalInfo: PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: "10101"))
    //let entrant = Manager(managerType: Entrant.ManagerType.ShiftManager, personalInfo: PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: "10101"))
    //let entrant = Manager(managerType: Entrant.ManagerType.SeniorManager, personalInfo: PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: "10101"))
    //let entrant = Manager(managerType: Entrant.ManagerType.GeneralManager, personalInfo: PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: "10101"))
    
    // Uncomment below to test personal info
    
    //DOB = nil
    //let entrant = Manager(managerType: Entrant.ManagerType.GeneralManager, personalInfo: PersonalInfo(dateOfBirth: nil, ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: "10101"))
    
    // SSN = ""
    //let entrant = Manager(managerType: Entrant.ManagerType.GeneralManager, personalInfo: PersonalInfo(dateOfBirth: "01/01/1970", ssn: "", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: "10101"))
    
    // First name = nil
    //let entrant = Manager(managerType: Entrant.ManagerType.GeneralManager, personalInfo: PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: nil, lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: "10101"))
    
    // Last name = ""
    //let entrant = Manager(managerType: Entrant.ManagerType.GeneralManager, personalInfo: PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: "10101"))
    
    // Street address = nil
    //let entrant = Manager(managerType: Entrant.ManagerType.GeneralManager, personalInfo: PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: nil, city: "Gotham", state: "IL", zipCode: "10101"))
    
    // City = ""
    //let entrant = Manager(managerType: Entrant.ManagerType.GeneralManager, personalInfo: PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "", state: "IL", zipCode: "10101"))
    
    // State = nil
    //let entrant = Manager(managerType: Entrant.ManagerType.GeneralManager, personalInfo: PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: nil, zipCode: "10101"))
    
    // Zipcode = ""
    //let entrant = Manager(managerType: Entrant.ManagerType.GeneralManager, personalInfo: PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: ""))
    
    // Uncomment below to test DOB under 5 years
    //let entrant = FreeChildGuest(personalInfo: PersonalInfo(dateOfBirth: "01/01/2010", ssn: nil, firstName: nil, lastName: nil, streetAddress: nil, city: nil, state: nil, zipCode: nil))
    
    // Uncomment below and chane dateOfBirth to test Happy Birthday
    //let entrant = Manager(managerType: Entrant.ManagerType.GeneralManager, personalInfo: PersonalInfo(dateOfBirth: "08/04/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: "10101"))
}

