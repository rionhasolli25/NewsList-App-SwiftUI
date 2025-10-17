//
//  AppleNewsView.swift
//  ListAppSwiftUI
//
//  Created by Rion on 17.10.25.
//

import SwiftUI


struct AppleNewsGridCell: View {
    let article: AppleArticle

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let imageUrl = article.urlToImage,
               let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .frame(height: 120)
                       
                        .clipped()
                       
                } placeholder: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 150)
                        ProgressView()
                    }
                }
            }

    
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "Untitled")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(4)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                
                Text(article.publishedAt ?? "")
                    .font(.caption)
                    .fontWeight(.thin)
                    .fontDesign(.rounded)
                    .foregroundColor(.primary)
                
            }
            .padding(.horizontal, 4)
            .padding(.bottom, 6)
        }
        .background(Color.white.opacity(1))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
    }
}


struct AppleNewsView: View {
    
    @StateObject var viewModel = AppleNewsViewmodel()
    @State private var selectedURL: URL?
    
    let columns = [
          GridItem(.flexible(), spacing: 10),
          GridItem(.flexible(), spacing: 10)
      ]

    
    var body: some View {
        NavigationView{
            ZStack{
                Image("101304060-72ff5b00-380d-11eb-8c58-a3172d791c9c")
                                    .resizable()
                                    .ignoresSafeArea()
                                   
                
                VStack(spacing:20){
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding()
                        TextField("Search articles...", text: $viewModel.searchtext)
                            .textFieldStyle(.automatic)
                            .padding(8)
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(Color.white.opacity(0.95))
                    .cornerRadius(20)
                    .shadow(color: .gray.opacity(0.2), radius: 3, x: 0, y: 2)
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    if viewModel.isloading{
                        ProgressView("Loading News...")
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(10)
                            .padding()
                    }
                    else{
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 15) {
                                ForEach(viewModel.filteredArticles, id: \.url) { article in
                                    AppleNewsGridCell(article: article)
                                        .onTapGesture {
                                            if let urlString = article.url,
                                               let url = URL(string: urlString) {
                                                UIApplication.shared.open(url)
                                            }
                                        }
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
                
                .navigationTitle(" Apple inc News")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    if viewModel.articles.isEmpty {
                        viewModel.getAppleNews { _ in }
                    }
                }
            }
            
        }
    }
    
#Preview {
    AppleNewsView()
}
