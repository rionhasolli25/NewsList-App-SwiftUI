//
//  AuthEndpoints.swift
//  NewsReadingApp
//
//  Created by Rion on 12.9.25.
//

import Foundation
import Alamofire
enum AuthenticationEndpoint : APIConfiguration{
    case getCollections
    case getLatestNews
    case getBitcoinNews
    case getProducts
    case getAppleNews
    case getProductByID(id:Int)
    case getbusinessNews
    case getSportNews
    case getHealthNews
    case getTeslaNews
    case getTechNews
    case getUSANews
    var method: HTTPMethod{
        switch self {
        case .getLatestNews,.getBitcoinNews,.getUSANews,.getAppleNews,.getProductByID,.getbusinessNews,.getSportNews,.getHealthNews,.getTeslaNews,.getProducts,.getTechNews
            :
            return .get
        case .getCollections:
            return.get
        }
    }
    var path: String{
        switch self {
        case .getCollections:
            return "everything?domains=wsj.com&apiKey=5341755edfa541f0ad23fc62089d75d0"
        case .getLatestNews:
            return "everything?domains=wsj.com&apiKey=5341755edfa541f0ad23fc62089d75d0"
        case .getBitcoinNews:
            return "everything?q=bitcoin&from=2025-09-20&sortBy=publishedAt&apiKey=5341755edfa541f0ad23fc62089d75d0"
        case .getAppleNews:
            return "everything?q=apple&from=2025-10-01&to=2025-10-01&sortBy=popularity&apiKey=5341755edfa541f0ad23fc62089d75d0"
        case .getProductByID(let id):
            return "https://dummyjson.com/products/\(id)"
        case .getbusinessNews:
            return ""
        case .getSportNews:
            return "everything?q=apple&from=2025-09-21&to=2025-09-21&sortBy=popularity&apiKey=5341755edfa541f0ad23fc62089d75d0"
        case .getHealthNews:
            return ""
        case .getTeslaNews:
            return "top-headlines?country=us&category=business&apiKey=5341755edfa541f0ad23fc62089d75d0"
        case .getProducts:
            return "everything?q=bitcoin&from=2025-09-20&sortBy=publishedAt&apiKey=5341755edfa541f0ad23fc62089d75d0"
        case .getTechNews:
            return "top-headlines?sources=techcrunch&apiKey=5341755edfa541f0ad23fc62089d75d0"
        case .getUSANews:
            return "top-headlines?country=us&category=business&apiKey=5341755edfa541f0ad23fc62089d75d0"
        }
    }
    var parameters: Parameters?{
        switch self {
        case .getLatestNews,.getUSANews,.getCollections,.getProductByID,.getbusinessNews,.getSportNews,.getHealthNews,.getTeslaNews,.getProducts,.getTechNews:
            return nil
            
        case .getBitcoinNews:
            return [
                "q": "bitcoin",
                "from": "2025-08-24",
                "sortBy": "publishedAt",
                "apiKey": "5341755edfa541f0ad23fc62089d75d0"
            ]
        case .getAppleNews:
            return[
                
                "q": "apple",
                "from": "2025-09-29",
                "to": "2025-09-29",
                "sortBy": "popularity",
                "apiKey": "5341755edfa541f0ad23fc62089d75d0"
            ]
                
            
        }
    }
    
    
    
    func asURLRequest() throws -> URLRequest {
        let urlString =  APIConstants.DevelopmentServer.healthURL + path
        let finalURL = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        var urlRequest = URLRequest(url: finalURL!)
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        print("urlRequest: \(urlRequest)")
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        // Authorization
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("Bearer \(UserDefaults.standard.value(forKey: "USER_TOKEN") ?? "")", forHTTPHeaderField: "Authorization")
        
        
        // Parameters
        if let parameters = parameters {
            if method == .get {
                // Encode parameters into URL query string for GET
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            } else {
                // Encode parameters into HTTP body for POST/PUT/PATCH
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            }
        }
        return urlRequest
        
    }
}
