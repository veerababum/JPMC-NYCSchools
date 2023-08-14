//
//  SchoolDetailsViewModelTests.swift
//  19860706-VeerababuMulugu-NYCSchoolsTests
//
//  Created by Mulugu, Veerababu on 08/10/23.
//

import XCTest
@testable import _9860706_VeerababuMulugu_NYCSchools

class SchoolDetailsViewModelTests: XCTestCase {
    
    func testSchoolDetailsViewModel() {
        let schoolDetailsViewModel = SchoolDetailsViewModel(schoolDetail: SchoolDetails(dbn: "01M292", school_name: "HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES", boro: "boro", overview_paragraph: "overview", school_10th_seats: "123", academicopportunities1: "academicopportunities1", academicopportunities2: "academicopportunities2", ell_programs: "ell_programs", neighborhood: "neighborhood", building_code: "109", location: "10 East 15th Street, Manhattan NY 10003 (40.736526, -73.992727)", phone_number: "212-524-4360", fax_number: "212-524-4365", school_email: "abc@abc.com", website: "www.theclintonschool.net", subway: "", bus: "", grades2018: "", finalgrades: "", total_students: "109", extracurricular_activities: "", school_sports: "", attendance_rate: "91", pct_stu_enough_variety: "", pct_stu_safe: "", school_accessibility_description: "", directions1: "", requirement1_1: "", requirement2_1: "", requirement3_1: "", requirement4_1: "", requirement5_1: "", offer_rate1: "", program1: "", code1: "", interest1: "", method1: "", seats9ge1: "", grade9gefilledflag1: "", grade9geapplicants1: "", seats9swd1: "", grade9swdfilledflag1: "", grade9swdapplicants1: "", seats101: "", admissionspriority11: "", admissionspriority21: "", admissionspriority31: "", grade9geapplicantsperseat1: "", grade9swdapplicantsperseat1: "", primary_address_line_1: "", city: "NY", zip: "56777", state_code: "1018", latitude: "", longitude: "", community_board: "", council_district: "", census_tract: "", bin: "", bbl: "", nta: "", borough: "", transfer: "", start_time: "", end_time: "", psal_sports_boys: "", psal_sports_girls: "", directions2: "", diplomaendorsements: "", psal_sports_coed: "", college_career_rate: "", advancedplacement_courses: "", language_classes: "", prgdesc1: "", program2: "", addtl_info1: ""))
        
        XCTAssert(schoolDetailsViewModel.schoolName == "HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES")
        XCTAssert(schoolDetailsViewModel.overview == "overview")
        XCTAssert(schoolDetailsViewModel.overview == "overview")
        XCTAssert(schoolDetailsViewModel.opportunities.contains("academicopportunities1") == true)
        XCTAssert(schoolDetailsViewModel.address.contains("NY") == true)
        XCTAssert(schoolDetailsViewModel.address.contains("56777") == true)
        XCTAssert(schoolDetailsViewModel.address.contains("1018") == true)
        
    }
}
