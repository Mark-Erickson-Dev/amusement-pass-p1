//
//  Entrant.swift
//  Amusement Park Pass Generator P1
//
//  Created by Mark Erickson on 8/3/18.
//  Copyright © 2018 Mark Erickson. All rights reserved.
//

import Foundation

protocol AreaAccessible {
    
    var isAmusementAreaAccesible: Bool { get set }
    var isKitchenAreaAccessible: Bool { get set }
    var isRideControlAreaAccessible: Bool  { get set }
    var isMaintenanceAreaAccessible: Bool { get set }
    var isOfficeAreaAccessible: Bool { get set }
    
}

enum RideAccessType: String {
    
    case StandardRider = "Standard Rider"
    case PriorityRider = "Priority Rider"
    case NonRider = "Non-Rider"
}

class Entrant: AreaAccessible {
    
    enum PassType: String {
        
        case Entrant = "Entrant"
        case FreeChildGuest = "Free Child Guest"
        case ClassicGuest = "Classic Guest"
        case VIPGuest = "VIP Guest"
        case FoodServicesEmployee = "Food Services Employee"
        case RideServicesEmployee = "Ride Services Employee"
        case MaintenanceEmployee = "Maintenance Employee"
        case Manager = "Manager"
        
    }
    
    enum ManagerType: String {
        
        case ShiftManager = "Shift Manager"
        case GeneralManager = "General Manager"
        case SeniorManager = "Senior Manager"
        
    }

    var personalInfo: PersonalInfo?
    
    var dobIsRequired: Bool
    var ssnIsRequired: Bool
    var nameIsRequired: Bool
    var addressIsRequired: Bool
    
    var passType: PassType
    
    var isAmusementAreaAccesible: Bool
    var isKitchenAreaAccessible: Bool
    var isRideControlAreaAccessible: Bool
    var isMaintenanceAreaAccessible: Bool
    var isOfficeAreaAccessible: Bool
    
    var rideAccess: RideAccessType
    
    var foodDiscount: Double
    var merchandiseDiscount: Double
    
    var managerType: ManagerType?

    init() {
        self.isAmusementAreaAccesible = false
        self.isKitchenAreaAccessible = false
        self.isRideControlAreaAccessible = false
        self.isMaintenanceAreaAccessible = false
        self.isOfficeAreaAccessible = false
        self.rideAccess = .StandardRider
        self.foodDiscount = 0.00
        self.merchandiseDiscount = 0.00
        self.passType = .Entrant
        self.personalInfo = nil
        self.dobIsRequired = false
        self.ssnIsRequired = false
        self.nameIsRequired = false
        self.addressIsRequired = false
    }
}

class ClassicGuest: Entrant {
    
    override init() {
        super.init()
        self.isAmusementAreaAccesible = true
        self.passType = .ClassicGuest
    }
}

class VIPGuest: ClassicGuest {
    
    override init() {
        super.init()
        self.rideAccess = .PriorityRider
        self.foodDiscount = 0.10
        self.merchandiseDiscount = 0.20
        self.passType = .VIPGuest
    }
}

class FreeChildGuest: ClassicGuest {
    
    init(personalInfo: PersonalInfo) {
        super.init()
        self.personalInfo = personalInfo
        self.dobIsRequired = true
        self.passType = .FreeChildGuest
    }
}

class Employee: Entrant {
    
    override init() {
        super.init()
        self.dobIsRequired = true
        self.ssnIsRequired = true
        self.nameIsRequired = true
        self.addressIsRequired = true
        self.isAmusementAreaAccesible = true
        self.foodDiscount = 0.15
        self.merchandiseDiscount = 0.25
    }
}

class FoodServicesEmployee: Employee {
    
    init(personalInfo: PersonalInfo) {
        super.init()
        self.isKitchenAreaAccessible = true
        self.personalInfo = personalInfo
        self.passType = .FoodServicesEmployee
    }
}

class RideServicesEmployee: Employee {
    
    init(personalInfo: PersonalInfo) {
        super.init()
        self.isRideControlAreaAccessible = true
        self.personalInfo = personalInfo
        self.passType = .RideServicesEmployee
    }
}

class MaintenanceEmployee: Employee {
    
    init(personalInfo: PersonalInfo) {
        super.init()
        self.isKitchenAreaAccessible = true
        self.isRideControlAreaAccessible = true
        self.isMaintenanceAreaAccessible = true
        self.personalInfo = personalInfo
        self.passType = .MaintenanceEmployee
    }
}

class Manager: Employee {
    
    init(managerType: ManagerType, personalInfo: PersonalInfo) {
        
        super.init()
        self.managerType = managerType
        self.isKitchenAreaAccessible = true
        self.isRideControlAreaAccessible = true
        self.isMaintenanceAreaAccessible = true
        self.isOfficeAreaAccessible = true
        self.foodDiscount = 0.25
        self.personalInfo = personalInfo
        self.passType = .Manager
    }
}

