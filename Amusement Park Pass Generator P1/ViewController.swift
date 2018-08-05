//
//  ViewController.swift
//  Amusement Park Pass Generator P1
//
//  Created by Mark Erickson on 8/3/18.
//  Copyright © 2018 Mark Erickson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var didValidate: Bool = false
    var entrant: Entrant!
    let currentDate = Date()
    let calendar = Calendar.current
    
    enum InfoError: Error {
        
        case InvalidFirstName, InvalidLastName, InvalidStreetAddress, InvalidCity, InvalidState, InvalidZipCode, InvalidDateOfBirth, InvalidSSN
        
        var description: String {
            
            switch self {
            case .InvalidFirstName: return "Enter a valid first name."
            case .InvalidLastName: return "Enter a valid last name."
            case .InvalidStreetAddress: return "Enter a valid street address."
            case .InvalidCity: return "Enter a valid city."
            case .InvalidState: return "Enter a valid state."
            case .InvalidZipCode: return "Enter a valid zip code."
            case .InvalidDateOfBirth: return "Enter a valid date of birth."
            case .InvalidSSN: return "Enter a valid social security number."
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get entrant type
        entrant = EntrantData().entrant
        
        entrant.passType == .Manager ? print("Pass Type: \(entrant.managerType?.rawValue ?? "")\n") : print("Pass Type: \(entrant.passType.rawValue)\n")
        
        do {
            // Get entrant's personal information and validate it, if applicable
            if let personalInfo = entrant.personalInfo {
                try validatePersonalInfo(personalInfo: personalInfo)
            }
            
            // Test entrant's access and discounts
            swipe()
            
        } catch InfoError.InvalidDateOfBirth {
            print(InfoError.InvalidDateOfBirth.description)
            
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
        
    func validatePersonalInfo(personalInfo: PersonalInfo) throws {
        
        if entrant.dobIsRequired {
            
            guard let dateOfBirth = personalInfo.dateOfBirth, dateOfBirth != "" else {

                throw InfoError.InvalidDateOfBirth
            }
            
            let dobComponents = dateOfBirth.components(separatedBy: "/")
            let dateDOB = Calendar.current.date(from: DateComponents(year: Int(dobComponents[2]), month: Int(dobComponents[0]), day: Int(dobComponents[1])))!
            let ageComponents = calendar.dateComponents([.year], from: dateDOB, to: currentDate)
            let age = ageComponents.year!
            
            if entrant.passType == .FreeChildGuest {
                guard age < 5 else {
                    
                    throw InfoError.InvalidDateOfBirth
                }
            }
            
            let result = checkForBirthDay(dateDOB: dateDOB)
            if result {
                print("Happy B-day!")
            }
            print("DOB: \(dateOfBirth) Age: \(age)")
        }
        
        if entrant.ssnIsRequired {
            
            guard let ssn = personalInfo.ssn, ssn != "" else {
                
                throw InfoError.InvalidSSN
            }
            print("SSN: \(ssn)")
        }
        
        if entrant.nameIsRequired {
            
            guard let firstName = personalInfo.firstName, firstName != "" else {
                
                throw InfoError.InvalidFirstName
            }
            
            guard let lastName = personalInfo.lastName, lastName != "" else {
                
                throw InfoError.InvalidLastName
            }
            print("NAME: \(firstName) \(lastName)")
        }
        
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
    
    func checkForBirthDay(dateDOB: Date) -> Bool {
        
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
    
    func shouldGrantAccess(isGranted: Bool) -> Bool {
        
        if isGranted {
            return true
        } else {
            return false
        }
    }
    
    func swipe() {
        
        var message = ""
        var result = false
        
        if let entrant = entrant {
            
            message = "Amusement Area Access:"
            result = shouldGrantAccess(isGranted: entrant.isAmusementAreaAccesible)
            print("\n\(message) \(result)")
            
            message = "Kitchen Area Access:"
            result = shouldGrantAccess(isGranted: entrant.isKitchenAreaAccessible)
            print("\(message) \(result)")
            
            message = "Ride Control Area Access:"
            result = shouldGrantAccess(isGranted: entrant.isRideControlAreaAccessible)
            print("\(message) \(result)")
            
            message = "Maintenance Area Access:"
            result = shouldGrantAccess(isGranted: entrant.isMaintenanceAreaAccessible)
            print("\(message) \(result)")
            
            message = "Office Area Access:"
            result = shouldGrantAccess(isGranted: entrant.isOfficeAreaAccessible)
            print("\(message) \(result)")
            
            message = "Ride Access:"
            result = shouldGrantAccess(isGranted: entrant.rideAccess == .PriorityRider || entrant.rideAccess == .StandardRider)
            print("\n\(message) \(result)")
            
            message = "Line Skipping:"
            result = shouldGrantAccess(isGranted: entrant.rideAccess == .PriorityRider)
            print("\(message) \(result)")
            
            message = "Food Discount:"
            result = shouldGrantAccess(isGranted: entrant.foodDiscount > 0.00)
            print("\n\(message) \(result) \(Int(entrant.foodDiscount * 100))%")
            
            message = "Merchandise Discount:"
            result = shouldGrantAccess(isGranted: entrant.merchandiseDiscount > 0.00)
            print("\(message) \(result) \(Int(entrant.merchandiseDiscount * 100))%")
            
        }
    }

}

