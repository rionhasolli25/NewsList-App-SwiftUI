//
//  APIConstants.swift
//  NewsReadingApp
//
//  Created by Rion on 12.9.25.
//

import Foundation
import Alamofire
struct APIConstants{
    struct DevelopmentServer {
      //  https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=5341755edfa541f0ad23fc62089d75d0
      
        static let healthURL = "https://newsapi.org/v2/"
    }
}
enum HTTPHeaderField : String{
case authentication = "Authorization"
case contentType = "Content-Type"
case acceptType = "Accept"
case acceptEncoding = "Accept-Encoding"
}
enum ContentType: String {
case json = "application/json"
}


