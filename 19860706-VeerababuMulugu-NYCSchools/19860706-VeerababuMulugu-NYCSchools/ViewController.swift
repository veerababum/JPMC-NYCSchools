//
//  ViewController.swift
//  19860706-VeerababuMulugu-NYCSchools
//
//  Created by Mulugu, Veerababu on 08/10/23.
//

import UIKit

class ViewController: UIViewController {
    var schoolViewModel: SchoolViewModel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    let schoolServiceURL = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    let schoolDetailsServiceURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    
    let apiClient = APIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        tableView.backgroundView = nil
        tableView.register(UINib(nibName: "SchoolTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "SchoolTableViewCell")
        schoolViewModel = SchoolViewModel()
        fetchSchoolData()
        fetchSchoolDetailData()
    }
    private func fetchSchoolData() {
        
        if let url = URL(string: schoolServiceURL) {
            apiClient.fetch(url) { (result: Result<[School], APIError>) in
                switch result {
                case .success(let schools):
                    DispatchQueue.main.async {
                        self.activityIndicator.stopAnimating()
                        self.schoolViewModel.schools = schools
                        self.tableView.reloadData()
                    }                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }    }
    
    private func fetchSchoolDetailData() {
        
        if let url = URL(string: schoolDetailsServiceURL) {
            apiClient.fetch(url) { (result: Result<[SchoolDetails], APIError>) in
                switch result {
                case .success(let schoolDetails):
                    DispatchQueue.main.async {
                        self.activityIndicator.stopAnimating()
                        self.schoolViewModel.schoolDetails = schoolDetails
                    }                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolViewModel.schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolTableViewCell") as? SchoolTableViewCell else {
            return UITableViewCell()
        }
        let school = schoolViewModel.schools[indexPath.row]
        cell.setData(school: school)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if activityIndicator.isAnimating {
            return
        }
        let school = schoolViewModel.schools[indexPath.row]
        if let schoolDetailsObj = schoolViewModel.schoolDetails.filter({ $0.dbn == school.dbn }).first {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let schoolDetailsVC = storyboard.instantiateViewController(identifier: "SchoolDetailsViewController") as? SchoolDetailsViewController {
                schoolDetailsVC.schoolDetailsViewModel = SchoolDetailsViewModel(schoolDetail: schoolDetailsObj)
                let school = schoolViewModel.schools[indexPath.row]
                schoolDetailsVC.school = school
                navigationController?.pushViewController(schoolDetailsVC, animated: true)
            }
        } else {
            // let alertView
        }
    }
}
