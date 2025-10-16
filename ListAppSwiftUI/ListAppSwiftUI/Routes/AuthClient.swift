//
//  AuthClient.swift
//  NewsReadingApp
//
//  Created by Rion on 12.9.25.
//

import Foundation
import Combine
import Alamofire

class AuthenticationClient{
    static func getCollections() -> Future<LatestNews,Error>{
        return APIClient.performRequest(route: AuthenticationEndpoint.getCollections)
    }
    static func getAlbums() -> Future<LatestNews,Error>{
        return APIClient.performRequest(route: AuthenticationEndpoint.getLatestNews)
    }
    static func getBitcoinNews() -> Future<Bitcoin,Error>{
        return APIClient.performRequest(route: AuthenticationEndpoint.getBitcoinNews)
    }
    static func getAppleNews() -> Future<AppleNews,Error>{
        return APIClient.performRequest(route: AuthenticationEndpoint.getAppleNews)
    }
    static func chooseProductDetails(id:Int) -> Future<Product,Error>{
        return APIClient.performRequest(route: AuthenticationEndpoint.getProductByID(id: id))
    }
    static func getBusinessNews() -> Future<BusinessNews,Error>{
        return APIClient.performRequest(route: AuthenticationEndpoint.getbusinessNews)
    }
    static func getSportNews() -> Future<Sportnews,Error>{
        return APIClient.performRequest(route: AuthenticationEndpoint.getSportNews)
    }
    static func getHealthNews() -> Future<HealthNews,Error>{
        return APIClient.performRequest(route: AuthenticationEndpoint.getHealthNews)
    }
    static func getTeslaNews() -> Future<Tesla,Error>{
        return APIClient.performRequest(route: AuthenticationEndpoint.getTeslaNews)
    }
    static func getProducts() -> Future<HealthNews,Error>{
        return APIClient.performRequest(route: AuthenticationEndpoint.getProducts)
    }
    static func getTechNews() -> Future<TechNews,Error>{
        return APIClient.performRequest(route: AuthenticationEndpoint.getTechNews)
    }
    static func getUSANews() -> Future<USANewsModel,Error>{
        return APIClient.performRequest(route: AuthenticationEndpoint.getUSANews)
    }
}
