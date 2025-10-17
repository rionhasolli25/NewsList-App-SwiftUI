//
//  NewsListView.swift
//  ListAppSwiftUI
//
//  Created by Rion on 16.10.25.
//

import SwiftUI

import SwiftUI
import SafariServices
import SwiftUI

struct NewsListView: View {
    @StateObject var viewModel = NewsListViewModel()
    @State private var selectedURL: URL?

    var body: some View {
        NavigationView {
            ZStack {
                Image( "101304060-72ff5b00-380d-11eb-8c58-a3172d791c9c")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                 
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search articles...", text: $viewModel.searchText)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(8)
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(Color.white.opacity(0.95))
                    .cornerRadius(20)
                    .shadow(color: .gray.opacity(0.2), radius: 3, x: 0, y: 2)
                    .padding(.horizontal)
                    .padding(.top, 20)

                    if viewModel.isLoading {
                        ProgressView("Loading News...")
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(10)
                            .padding()
                    } else {
                        // 📰 News List
                        List(viewModel.filteredArticles, id: \.url) { article in
                            NewsRowView(article: article)
                                .listRowInsets(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                                .listRowBackground(Color.clear)
                                .onTapGesture {
                                    if let urlString = article.url,
                                       let url = URL(string: urlString) {
                                        UIApplication.shared.open(url)
                                    }
                                }
                        }
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
                    }
                }
            }
            .navigationTitle("📰 Top News")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                if viewModel.articles.isEmpty {
                    viewModel.getSportNews { _ in }
                }
            }
        }
    }
}
// MARK: - News Row
struct NewsRowView: View {
    let article: SportArticle

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // 🖼️ Thumbnail
            if let imageUrl = article.urlToImage,
               let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100) // slightly larger height
                        .clipped()
                        .cornerRadius(10)
                } placeholder: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 100, height: 150)
                        ProgressView()
                    }
                }
            }

            // 📰 Text content
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "Untitled")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)

                Text(article.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(3)

                Spacer(minLength: 4)

                HStack {
                    Text(article.source?.name ?? "")
                        .font(.caption)
                        .foregroundColor(.blue.opacity(0.7))
                    Spacer()
                    Text(article.publishedAt?.prefix(10) ?? "")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.vertical, 10) // tighter padding, not 50
        .padding(.horizontal, 10)
        .background(Color.white.opacity(0.85))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}

// MARK: - Main View
struct MainNewsView: View {
    @State private var selectedTab: CustomTabBar.Tab = .home
    
    var body: some View {
        ZStack{
            Image( "101304060-72ff5b00-380d-11eb-8c58-a3172d791c9c")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            ZStack(alignment: .bottom) {
                if let uiImage = UIImage(named: "") {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                    
                } else {
                    Color.red.opacity(0.3).ignoresSafeArea()
                }
                
                Group {
                    switch selectedTab {
                    case .home:
                        AppleNewsView()
                    case .news:
                        NewsListView()
                    case .hidden:
                        Text("👁 Hidden Section")
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                
                // 🧭 Floating tab bar
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
    }
}

// MARK: - News List with transparent backgrounds
struct TransparentNewsListView: View {
    @StateObject var viewModel = NewsListViewModel()
    @State private var selectedURL: URL?

    init() {
        // make UITableView transparent for older iOS
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TextField("Search articles...", text: $viewModel.searchText)
                    .padding(10)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .padding()

                if viewModel.isLoading {
                    ProgressView("Loading News...")
                        .foregroundColor(.white)
                        .padding()
                } else {
                    List(viewModel.filteredArticles, id: \.url) { article in
                        NewsRow(article: article)
                            .listRowBackground(Color.clear)
                            .onTapGesture {
                                if let urlString = article.url,
                                   let url = URL(string: urlString) {
                                    selectedURL = url
                                }
                            }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden) // 🔑 iOS16+ transparency
                }
            }
            .background(Color.clear)
            .navigationTitle("News Section")
        }
        .background(Color.clear)
    }
}

#Preview {
    MainNewsView()
}
