//
//  ServerResponse.swift
//  NewsReadingApp
//
//  Created by Rion on 12.9.25.
//

import Foundation
struct ServerResponse: Codable{
//    var data : String?
    var successMessage : String?
    var isSuccess : Bool?
    var errorModel : [ErrorModel]?
    var status : String?
}
struct ErrorModel: Codable{
    var code : String?
    var message : String?
}
