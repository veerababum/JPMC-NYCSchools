//
//  SchoolTableViewCell.swift
//  19860706-VeerababuMulugu-NYCSchools
//
//  Created by Mulugu, Veerababu on 08/10/23.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var websiteLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    var school: [School]!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Outer view for shadow
//        containerView.layer.cornerRadius = 4
//        containerView.layer.masksToBounds = true
//        
//        containerView.layer.shadowOpacity = 0.18
//        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
//        containerView.layer.shadowRadius = 2
//        containerView.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
//        containerView .layer.masksToBounds = false
        
        
        // add border and color
        containerView.backgroundColor = UIColor.white
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 8
        containerView.clipsToBounds = true

//        nameLabel.text = "name sdgdafhsfhgfgsdh sfghsfhsfhsdgdafhsfhgfgsdh sfghsfhsfhsdgdafhsfhgfgsdh sfghsfhsfhsdgdafhsfhgfgsdh sfghsfhsfh"
//        addressLabel.text = "Adreee"
//        websiteLabel.text = "wwww."

    }
    
    func setData(school: School) {

        nameLabel.text =  school.name
        addressLabel.text = school.addresLine + ", " + school.city + ", " + school.state + ", " + school.zip
        websiteLabel.text = school.website

    }
}
