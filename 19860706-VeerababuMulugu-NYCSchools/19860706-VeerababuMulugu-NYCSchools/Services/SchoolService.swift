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

    func fetchData<T: Decodable>(from urlString: String, responseType: T.Type, completionHandler: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            
            guard let unwrappedData = data else {
                completionHandler(.failure(NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(T.self, from: unwrappedData)
                completionHandler(.success(responseModel))
            } catch {
                completionHandler(.failure(error))
            }
        }.resume()
    }
    
    func getSchools(completionHandler: @escaping (Result<[School], Error>) -> Void) {
        fetchData(from: schoolServiceURL, responseType: [School].self, completionHandler: completionHandler)
    }
    
    func getSchoolDetails(completionHandler: @escaping (Result<[SchoolDetails], Error>) -> Void) {
        fetchData(from: schoolDetailsServiceURL, responseType: [SchoolDetails].self, completionHandler: completionHandler)
    }
}
