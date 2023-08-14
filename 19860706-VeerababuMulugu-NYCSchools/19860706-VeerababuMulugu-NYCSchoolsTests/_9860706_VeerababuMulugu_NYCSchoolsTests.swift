//
//  _9860706_VeerababuMulugu_NYCSchoolsTests.swift
//  19860706-VeerababuMulugu-NYCSchoolsTests
//
//  Created by Mulugu, Veerababu on 08/10/23.
//

import XCTest
@testable import _9860706_VeerababuMulugu_NYCSchools

class SchoolViewModelTests: XCTestCase {

    func testSchoolViewModelWithNoObjects() throws {
        let schoolViewModel = SchoolViewModel()
        XCTAssert(schoolViewModel.schoolDetails.count == 0)
        XCTAssert(schoolViewModel.schools.count == 0)
    }
    
    func testSchoolViewModelWithObjects() throws {
        let school = School(dbn: "01M292", school_name: "HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES", num_of_sat_test_takers: "29", sat_critical_reading_avg_score: "355", sat_math_avg_score: "55", sat_writing_avg_score: "5")
        let schoolViewModel = SchoolViewModel(schools: [school], schoolDetails: [])
        XCTAssert(schoolViewModel.schoolDetails.count == 0)
        XCTAssert(schoolViewModel.schools.count == 1)
        XCTAssert(schoolViewModel.schools[0].dbn == "01M292")
        XCTAssert(schoolViewModel.schools[0].school_name == "HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES")
        XCTAssert(schoolViewModel.schools[0].num_of_sat_test_takers == "29")
        XCTAssert(schoolViewModel.schools[0].sat_critical_reading_avg_score == "355")
        XCTAssert(schoolViewModel.schools[0].sat_math_avg_score == "55")
        XCTAssert(schoolViewModel.schools[0].sat_math_avg_score == "5")
    }

}
