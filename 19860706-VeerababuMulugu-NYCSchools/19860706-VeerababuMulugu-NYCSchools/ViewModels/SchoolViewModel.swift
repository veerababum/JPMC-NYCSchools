//
//  SchoolViewModel.swift
//  19860706-VeerababuMulugu-NYCSchools
//
//  Created by Mulugu, Veerababu on 08/10/23.
//

import Foundation

class SchoolViewModel {
    var schools: [School] = []
    var schoolDetails: [SchoolDetails] = []

    init(schools: [School] = [], schoolDetails: [SchoolDetails] = []) {
        self.schools = schools
        self.schoolDetails = schoolDetails
    }
}
