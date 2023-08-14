//
//  SchoolDetailsViewController.swift
//  19860706-VeerababuMulugu-NYCSchools
//
//  Created by Mulugu, Veerababu on 08/10/23.
//

import UIKit

class SchoolDetailsViewController: UIViewController {
    
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var opportunitiesLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var readingLabel: UILabel!
    @IBOutlet weak var wrintingLabel: UILabel!
    @IBOutlet weak var mathLabel: UILabel!

    var schoolDetailsViewModel: SchoolDetailsViewModel!
    var school: School!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SAT Score"
        setupData()
    }
    
    private func setupData() {
        schoolLabel.text = schoolDetailsViewModel.schoolName
        overviewLabel.text = schoolDetailsViewModel.overview
        opportunitiesLabel.text = schoolDetailsViewModel.opportunities
        websiteLabel.text = schoolDetailsViewModel.website
        addressLabel.text = schoolDetailsViewModel.address
        readingLabel.text = "Reading: \(school.sat_critical_reading_avg_score)"
        wrintingLabel.text = "Writing: \(school.sat_critical_reading_avg_score)"
        mathLabel.text = "Math: \(school.sat_math_avg_score)"
    }
    
}
