//
//  SchoolService.swift
//  19860706-VeerababuMulugu-NYCSchools
//
//  Created by Mulugu, Veerababu on 08/10/23.
//

import Foundation

class SchoolService {
    let schoolServiceURL = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    let schoolDetailsServiceURL = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    
    func getSchools(completionHandler: @escaping ([School]) -> ()) {
        let url = URL(string: schoolServiceURL)
        let session = URLSession.shared
        session.dataTask(with: url!) { Data, _, _ in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode([School].self, from: Data!)
                completionHandler(responseModel)
            }
            catch {
                print("error in parsing")
            }
            
        }.resume()
    }
    
    func getSchoolDetails(completionHandler: @escaping ([SchoolDetails]) -> ()) {
        let url = URL(string: schoolDetailsServiceURL)
        let session = URLSession.shared
        session.dataTask(with: url!) { Data, _, _ in
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode([SchoolDetails].self, from: Data!)
                completionHandler(responseModel)
            }
            catch {
                print("error in parsing")
            }
            
        }.resume()
    }
}
