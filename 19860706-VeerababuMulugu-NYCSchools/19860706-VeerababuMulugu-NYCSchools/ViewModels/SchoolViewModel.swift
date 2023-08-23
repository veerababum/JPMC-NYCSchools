//
//  SchoolViewModel.swift
//  19860706-VeerababuMulugu-NYCSchools
//
//  Created by Mulugu, Veerababu on 08/10/23.
//

import Foundation

class SchoolViewModel {
    
    // MARK: - Properties
    private let apiClient: APIClient

    private let schoolServiceURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    
    // This will notify the View when the data is fetched
    var schools: [School] {
        didSet {
            self.reloadDataClosure?()
        }
    }
    
    var errorMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
    
    // MARK: - Closures for callback
    var reloadDataClosure: (() -> Void)?
    var showAlertClosure: (() -> Void)?
    
    // MARK: - Initialization
    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
        self.schools = []   
    }

    
    func fetchSchools() {
        guard let url = URL(string: schoolServiceURL) else {
            print("Invalid URL")
            return
        }
        
        apiClient.fetch(url) { [weak self] (result: Result<[School], APIError>) in
            switch result {
            case .success(let schools):
                self?.schools = schools
            case .failure(let error):
                print("Error: \(error)")
                self?.errorMessage = error.localizedDescription
            }
        }
    }
}
