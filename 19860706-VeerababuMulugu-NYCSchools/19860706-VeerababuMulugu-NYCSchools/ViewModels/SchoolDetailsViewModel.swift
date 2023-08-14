//
//  SchoolDetailsViewModel.swift
//  19860706-VeerababuMulugu-NYCSchools
//
//  Created by Mulugu, Veerababu on 08/10/23.
//

import Foundation

class SchoolDetailsViewModel {
    var schoolDetail: SchoolDetails!
    
    init(schoolDetail: SchoolDetails) {
        self.schoolDetail = schoolDetail
    }
    
    var schoolName: String {
        return schoolDetail.school_name ?? ""
    }
    
    var overview: String {
        return schoolDetail.overview_paragraph ?? ""
    }
    
    var address: String {
        if let addressline1 = schoolDetail.primary_address_line_1,
           let city = schoolDetail.city,
           let stateCode = schoolDetail.state_code,
           let zip = schoolDetail.zip
        {
            return addressline1 + "\n" + city + "\n" + stateCode + ", " + zip
        }
        return "Address"
    }
    
    var opportunities: String {
        if let academicopportunities1 = schoolDetail.academicopportunities1,
           let academicopportunities2 = schoolDetail.academicopportunities2
        {
            return academicopportunities1 + "\n" + academicopportunities2
        }
        return ""
    }
    
    var website: String {
        return schoolDetail.website ?? ""
    }
}
