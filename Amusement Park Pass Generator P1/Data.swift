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
    //let entrant = VIPGuest()
    //let entrant = FreeChildGuest()
    //let entrant = FoodServicesEmployee()
    //let entrant = RideServicesEmployee()
    //let entrant = MaintenanceEmployee()
    //let entrant = Manager(managerType: Entrant.ManagerType.ShiftManager)
    //let entrant = Manager(managerType: Entrant.ManagerType.SeniorManager)
    let entrant = Manager(managerType: Entrant.ManagerType.GeneralManager)
}

struct PersonalData {
    
    func getPersonalData() -> PersonalInfo? {
        
        //return nil
    
        // Uncomment below to test personal info
        
        // Full personal info
        // Change dateOfBirth to test under 5 years old and happy b-day
        return PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: "10101")
        
        //DOB = nil
        //return PersonalInfo(dateOfBirth: nil, ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: "10101")
        
        // SSN = ""
        //return PersonalInfo(dateOfBirth: "01/01/1970", ssn: "", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: "10101")
        
        // First name = nil
        //return PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: nil, lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: "10101")
        
        // Last name = ""
        //return PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: "10101")
        
        // Street address = nil
        //return PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: nil, city: "Gotham", state: "IL", zipCode: "10101")
        
        // City = ""
        //return PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "", state: "IL", zipCode: "10101")
        
        // State = nil
        //return PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: nil, zipCode: "10101")
        
        // Zipcode = ""
        //return PersonalInfo(dateOfBirth: "01/01/1970", ssn: "123-45-6789", firstName: "Bruce", lastName: "Wayne", streetAddress: "123 Bat Cave", city: "Gotham", state: "IL", zipCode: "")
    }
}








