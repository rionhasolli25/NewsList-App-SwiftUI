//
//  NewsListViewModelProtocol.swift
//  ListAppSwiftUI
//
//  Created by Rion on 16.10.25.
//

import Foundation

protocol BaseViewModel : AnyObject{
    
}

protocol NewsListViewModelViewDelegate: AnyObject {
    func openWebPage(url: String)
}

// MARK: - ViewModel Protocol
protocol NewsListViewModelProtocol: ObservableObject {
    var articles: [SportArticle] { get set }
    var filteredArticles: [SportArticle] { get set }
    var searchText: String { get set }
    var isLoading: Bool { get set }
    func getSportNews(completion : @escaping((Sportnews?) -> Void))
    func filterArticles(with text: String)
}
