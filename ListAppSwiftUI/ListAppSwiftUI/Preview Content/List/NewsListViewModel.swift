//
//  NewsListViewModel.swift
//  ListAppSwiftUI
//
//  Created by Rion on 16.10.25.
//

import Foundation
import Combine

class NewsListViewModel: NewsListViewModelProtocol {
  
    
    @Published var articles: [SportArticle] = []
    @Published var filteredArticles: [SportArticle] = []
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false

    private var cancellables = Set<AnyCancellable>()
    weak var viewDelegate: NewsListViewModelViewDelegate?

    init() {
        setupSearchBinding()
        
    }

    // MARK: - API Request
    func getSportNews(completion: @escaping ((Sportnews?) -> Void)) {
        isLoading = true
        let auth = AuthenticationClient.getSportNews()
        auth.execute(onSuccess: { [weak self] response in
            DispatchQueue.main.async {
                guard let self = self else { return }
                print("✅ API success — articles count:", response.articles?.count ?? 0)
                self.articles = response.articles ?? []
                self.filteredArticles = response.articles ?? []
                self.isLoading = false
                completion(response)
            }
        }, onFailure: { [weak self] error in
            DispatchQueue.main.async {
                self?.isLoading = false
                completion(nil)
            }
        })
    }

    func showScreen() {
        
    }
    
    // MARK: - Search Handling
    private func setupSearchBinding() {
        $searchText
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
