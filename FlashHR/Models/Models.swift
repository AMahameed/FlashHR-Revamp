//
//  Models.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 20/10/2022.
//

import Foundation

struct Company {
    var companyName: String = ""
    var companyUID: String = ""
    var companyDeps: [Department] = []
}

struct Department {
    var depName: String = ""
    var depUID: String = ""
    var departmentEmps: [Employee] = []
}

class Employee {
    var empUID: String = ""
    var empImageData: Data = Data()
    var email: String = ""
    var password: String = ""
    var name: String = ""
    var title: String = ""
    var mobile: String = ""
    var department: String = ""
    var isDeleted: Bool = false
    var level: Level = Level()
    var workTransactions: [WorkTansactions] = []
    
    init(empUID: String = "", empImageData: Data = Data(), email: String = "", password: String = "", name: String = "", title: String = "", mobile: String = "", department: String = "", isDeleted: Bool = false, level: Level = Level(), workTransactions: [WorkTansactions] = []) {
        
        self.empUID = empUID
        self.empImageData = empImageData
        self.name = name
        self.mobile = mobile
        self.title = title
        self.department = department
        self.password = password
        self.email = email
        self.isDeleted = isDeleted
        self.level = level
        self.workTransactions = workTransactions
    }
}

struct Level{
    var isHRManager: Bool = false
    var isHRAgent: Bool = false
    var isManager: Bool = false
    var isSupervisor: Bool = false
    var isEmployee: Bool = false
}

struct WorkTansactions {
    var projectName: String = ""
    var contactNo: String = ""
    var startTime: String = ""
    var dayStr: String = ""
    var workingHours: Int = 0
    var long: Double = 0.0
    var lat: Double = 0.0
    var isRequestedLeave: Bool = false
    var isWorked: Bool = false
    var isWorkedTotally: Bool = false
    var leaveHours: Float = 0.0
    var actualStart: String = ""
    var actualEnd: String = ""
    var actualWorkingHours: String = ""
}

