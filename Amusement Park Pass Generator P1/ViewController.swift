//
//  ViewController.swift
//  Amusement Park Pass Generator P1
//
//  Created by Mark Erickson on 8/3/18.
//  Copyright © 2018 Mark Erickson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var entrant: Entrant!
    let currentDate = Date()
    let calendar = Calendar.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get entrant type
        entrant = EntrantData().entrant
        
        // Prints out the entrant's pass type
        entrant.passType == .Manager ? print("Pass Type: \(entrant.managerType?.rawValue ?? "")\n") : print("Pass Type: \(entrant.passType.rawValue)\n")
        
        // Get personal info
        if entrant.personalInfoIsRequired {
            guard let personalInfo = PersonalData().getPersonalData() else {
                print("Uncomment a personalInfo object from the Data file.")
                return
            }
            entrant.personalInfo = personalInfo
        } else {
            print("No personal info required")
        }

        do {
            // Validate entrant's personal info, if applicable
            if let personalInfo = entrant.personalInfo {
                try validatePersonalInfo(personalInfo: personalInfo)
            }
            
            // Test entrant's access and discounts
            swipe()
            
        } catch InfoError.InvalidDateOfBirth {
            print(InfoError.InvalidDateOfBirth.description)
            
        } catch InfoError.InvalidChildAge {
            print(InfoError.InvalidChildAge.description)
            
        } catch InfoError.InvalidSSN {
            print(InfoError.InvalidSSN.description)
            
        } catch InfoError.InvalidFirstName {
            print(InfoError.InvalidFirstName.description)
            
        } catch InfoError.InvalidLastName {
            print(InfoError.InvalidLastName.description)
            
        } catch InfoError.InvalidStreetAddress {
            print(InfoError.InvalidStreetAddress.description)
            
        } catch InfoError.InvalidCity {
            print(InfoError.InvalidCity.description)
            
        } catch InfoError.InvalidState {
            print(InfoError.InvalidState.description)
            
        } catch InfoError.InvalidZipCode {
            print(InfoError.InvalidZipCode.description)
            
        } catch let error {
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Validation
    
    // Checks for required data from the personalInfo object, missing data reults in an error message being thrown
    func validatePersonalInfo(personalInfo: PersonalInfo) throws {
        
        // Gets the dateOfBirth from the personalInfo object and ensures it is not nil or empty
        if entrant.dobIsRequired {
            
            guard let dateOfBirth = personalInfo.dateOfBirth, dateOfBirth != "" else {

                throw InfoError.InvalidDateOfBirth
            }
            
            // Converts dateOfBirth string to a date and gets the age
            let dobComponents = dateOfBirth.components(separatedBy: "/")
            let dateDOB = Calendar.current.date(from: DateComponents(year: Int(dobComponents[2]), month: Int(dobComponents[0]), day: Int(dobComponents[1])))!
            let ageComponents = calendar.dateComponents([.year], from: dateDOB, to: currentDate)
            let age = ageComponents.year!
            
            // Checks if a child is older than 5
            if entrant.passType == .FreeChildGuest {
                guard age < 5 else {
                    
                    throw InfoError.InvalidChildAge
                }
            }
            
            // Calls checkForBirthDay which returns a bool indicating whether the dateOfBirth matched the current date
            let result = checkForBirthDay(dateDOB: dateDOB)
            if result {
                print("Happy B-day!")
            }
            print("DOB: \(dateOfBirth) Age: \(age)")
        }
        
        // Gets the ssn from the personalInfo object and ensures it is not nil or empty
        if entrant.ssnIsRequired {
            
            guard let ssn = personalInfo.ssn, ssn != "" else {
                
                throw InfoError.InvalidSSN
            }
            print("SSN: \(ssn)")
        }
        
        // Gets the firstName and lastName from the personalInfo object and ensures they are not nil or empty
        if entrant.nameIsRequired {
            
            guard let firstName = personalInfo.firstName, firstName != "" else {
                
                throw InfoError.InvalidFirstName
            }
            
            guard let lastName = personalInfo.lastName, lastName != "" else {
                
                throw InfoError.InvalidLastName
            }
            print("NAME: \(firstName) \(lastName)")
        }
        
        // Gets the streetAddress, city, state, and zipCode from the personalInfo object and ensures they are not nil or empty
        if entrant.addressIsRequired {
            
            guard let streetAddress = personalInfo.streetAddress, streetAddress != "" else {
                
                throw InfoError.InvalidStreetAddress
            }
            
            guard let city = personalInfo.city, city != "" else {
                
                throw InfoError.InvalidCity
            }
            
            guard let state = personalInfo.state, state != "" else {
                
                throw InfoError.InvalidState
            }
            
            guard let zipCode = personalInfo.zipCode, zipCode != "" else {
                
                throw InfoError.InvalidZipCode
            }
            print("ADDRESS: \(streetAddress)\n\(city), \(state) \(zipCode)")
        }
    }
    
    // Checks date of birth as a date and returns a bool, indicating whether the date of birth matched the current date
    func checkForBirthDay(dateDOB: Date) -> Bool {
        
        // Extracts the month and day from the current date and birth date
        let currentDateMonth = calendar.component(.month, from: currentDate)
        let currentDateDay = calendar.component(.day, from: currentDate)
        let dobMonth = calendar.component(.month, from: dateDOB)
        let dobDay = calendar.component(.day, from: dateDOB)
        
        if currentDateMonth == dobMonth && currentDateDay == dobDay {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Test Access

    // Tests whether or not an entrant has access to certain areas, rides, line skipping, or discounts
    // Based on the bool value, a message is printed to show the result
    func swipe() {
        
        var message = ""
        var result = false
        
        if let entrant = entrant {
            
            message = "Amusement Area Access:"
            result = entrant.isAmusementAreaAccesible
            print("\n\(message) \(result)")
            
            message = "Kitchen Area Access:"
            result = entrant.isKitchenAreaAccessible
            print("\(message) \(result)")
            
            message = "Ride Control Area Access:"
            result = entrant.isRideControlAreaAccessible
            print("\(message) \(result)")
            
            message = "Maintenance Area Access:"
            result = entrant.isMaintenanceAreaAccessible
            print("\(message) \(result)")
            
            message = "Office Area Access:"
            result = entrant.isOfficeAreaAccessible
            print("\(message) \(result)")
            
            message = "Ride Access:"
            result = entrant.rideAccess == .PriorityRider || entrant.rideAccess == .StandardRider
            print("\n\(message) \(result)")
            
            message = "Line Skipping:"
            result = entrant.rideAccess == .PriorityRider
            print("\(message) \(result)")
            
            message = "Food Discount:"
            result = entrant.foodDiscount > 0.00
            print("\n\(message) \(result) \(Int(entrant.foodDiscount * 100))%")
            
            message = "Merchandise Discount:"
            result = entrant.merchandiseDiscount > 0.00
            print("\(message) \(result) \(Int(entrant.merchandiseDiscount * 100))%")
        }
    }

}

