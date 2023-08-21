//
//  SchoolService.swift
//  19860706-VeerababuMulugu-NYCSchools
//
//  Created by Mulugu, Veerababu on 08/10/23.
//

import Foundation


class APIClient {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetch<T: Decodable>(_ url: URL, completion: @escaping (Result<T, APIError>) -> Void) {
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                if let error = error {
                    completion(.failure(.other(error)))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200,
                      let data = data else {
                    completion(.failure(.requestFailed))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let value = try decoder.decode(T.self, from: data)
                    completion(.success(value))
                } catch {
                    completion(.failure(.decodingFailure))
                }
            }
        }
        
        task.resume()
    }
}

enum APIError: Error {
    case requestFailed
    case decodingFailure
    case invalidURL
    case other(Error)
}
