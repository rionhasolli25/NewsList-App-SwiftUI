//
//  AppleNewsViewDelegate.swift
//  ListAppSwiftUI
//
//  Created by Rion on 17.10.25.
//

import Foundation

protocol AppleNewsViewDelegate : AnyObject{
    func print()
}

protocol AppleNewsViewmodelProtocol : ObservableObject{
    func print()
    var articles: [AppleArticle] { get set }
    var filteredArticles: [AppleArticle] { get set }
    var searchtext:String {get set}
    var isloading: Bool {get set}
    var coordinateDelegate: AppleNewsViewDelegate? {get set}
    func getAppleNews(completion : @escaping((AppleNews?) -> Void))
}
