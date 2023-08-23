//
//  SchoolDetailsViewController.swift
//  19860706-VeerababuMulugu-NYCSchools
//
//  Created by Mulugu, Veerababu on 08/10/23.
//

import UIKit

class SchoolDetailsViewController: UIViewController {
    
    private var viewModel: SchoolViewModel!

    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var opportunitiesLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var readingLabel: UILabel!
    @IBOutlet weak var wrintingLabel: UILabel!
    @IBOutlet weak var mathLabel: UILabel!
    private let schoolDetailsUrl = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"

    var school: School!
    let apiClient = APIClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SAT Score"
        
        if school != nil {
            print("selected school is \(school)")
            // Populate your views using the school object
        }
        setupData()
        fetchSchoolDetailData()
    }
    
        private func fetchSchoolDetailData() {

            if let url = URL(string: schoolDetailsUrl) {
                apiClient.fetch(url) { (result: Result<[SATScore], APIError>) in
                    switch result {
                    case .success(let schoolDetails):
                        DispatchQueue.main.async {
//                            self.schoolViewModel.schoolDetails = schoolDetails
                        }                case .failure(let error):
                        print("Error: \(error)")
                    }
                }
            }
        }
    
    private func setupData() {
//        schoolLabel.text = school.schoolName
//        overviewLabel.text = school.overview
//        opportunitiesLabel.text = school.opportunities
//        websiteLabel.text = school.website
//        addressLabel.text = school.address
//        readingLabel.text = "Reading: \(school.sat_critical_reading_avg_score)"
//        wrintingLabel.text = "Writing: \(school.sat_critical_reading_avg_score)"
//        mathLabel.text = "Math: \(school.sat_math_avg_score)"
    }
    
}
