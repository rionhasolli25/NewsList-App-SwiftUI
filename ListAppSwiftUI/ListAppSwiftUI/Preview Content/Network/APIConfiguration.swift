//
//  APIConfiguration.swift
//  NewsReadingApp
//
//  Created by Rion on 12.9.25.
//

import Foundation
import Alamofire
protocol APIConfiguration : URLRequestConvertible{
    var method : HTTPMethod {get}
    var path : String {get}
    var parameters : Parameters? {get}
}
