//
//  AppleNewsViewModel.swift
//  ListAppSwiftUI
//
//  Created by Rion on 17.10.25.
//

import Foundation
import Combine

class AppleNewsViewmodel : AppleNewsViewmodelProtocol{
    
    @Published var filteredArticles: [AppleArticle] = []
    @Published var isloading: Bool = false
    @Published var searchtext: String = ""
    @Published var articles: [AppleArticle] = []
    @Published var coordinateDelegate:  AppleNewsViewDelegate?
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init(){
        setupSearchBinding()
    }
    
    func getAppleNews(completion: @escaping ((AppleNews?) -> Void)) {
        isloading = true
        let auth = AuthenticationClient.getAppleNews()
        auth.execute(onSuccess: { [weak self] response in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.articles = response.articles ?? []
                self.filteredArticles = response.articles ?? []
                self.isloading = false
                completion(response)
            }
        }, onFailure: { [weak self] error in
            DispatchQueue.main.async {
                self?.isloading = false
                completion(nil)
            }
        })
    }
    
    func print() {
    }
    
    // MARK: - Search Handling
     func setupSearchBinding() {
         self.$searchtext
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .sink { [weak self] text in
                self?.filterArticles(with: text)
            }
            .store(in: &cancellables)
    }

    func filterArticles(with text: String) {
        guard !text.isEmpty else {
            filteredArticles = articles
            return
        }

        filteredArticles = articles.filter {
            $0.title?.lowercased().contains(text.lowercased()) ?? false
        }
    }
    
    
    
}
