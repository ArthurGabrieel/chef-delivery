//
//  Service.swift
//  ChefDelivery
//
//  Created by Arthur Gabriel Gomes on 25/12/23.
//

import Foundation
import Alamofire

enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

struct StoreService {
    let baseUrl = "https://private-d5979b-chefdelivery5.apiary-mock.com/stores"
    
    func fetchData(completion: @escaping ([StoreType]?, Error?) -> Void) {
        AF.request(baseUrl).responseDecodable(of: [StoreType].self, completionHandler: { response in
            switch response.result {
            case .success(let stores):
                completion(stores, nil)
            case .failure(let error):
                completion(nil , error)
            }
        })
    }
    
    func confirmOrder(product: ProductType, completion: @escaping (Result<String?, RequestError>) -> Void) {
        AF.request(baseUrl, method: .post, parameters: product, encoder: JSONParameterEncoder.default)
            .response { response in
                switch response.result {
                case .success(let data):
                    do {
                        if let jsonDictionary = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                            completion(.success(jsonDictionary["message"] as? String))
                        } else {
                            completion(.failure(.errorRequest(error: "Invalid data format")))
                        }
                    } catch {
                        completion(.failure(.errorRequest(error: error.localizedDescription)))
                    }
                case .failure(let error):
                    completion(.failure(.errorRequest(error: error.localizedDescription)))
                }
            }
    }
}
