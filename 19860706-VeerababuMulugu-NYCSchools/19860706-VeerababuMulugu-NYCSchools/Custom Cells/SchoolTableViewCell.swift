//
//  SchoolTableViewCell.swift
//  19860706-VeerababuMulugu-NYCSchools
//
//  Created by Mulugu, Veerababu on 08/10/23.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {
    @IBOutlet var schoolLabel: UILabel!
    @IBOutlet var satReadingAverageScoreLabel: UILabel!
    @IBOutlet var satMathAverageScoreLabel: UILabel!
    @IBOutlet var satWritingAverageScoreLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 4
        containerView.layer.masksToBounds = true
        
        containerView.layer.shadowOpacity = 0.18
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowRadius = 2
        containerView.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        containerView.layer.masksToBounds = false
    }
    
    func setData(school: School) {
        schoolLabel.text = school.school_name + "(" + school.num_of_sat_test_takers + ")"
        satReadingAverageScoreLabel.text = "SAT Critical reading Average Score:" + school.sat_critical_reading_avg_score
        satMathAverageScoreLabel.text = "SAT Maths Average Score:" + school.sat_math_avg_score
        satWritingAverageScoreLabel.text = "SAT Writing Average Score:" + school.sat_writing_avg_score
    }
}
