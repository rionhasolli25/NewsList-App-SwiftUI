//
//  NewsView.swift
//  ListAppSwiftUI
//
//  Created by Rion on 16.10.25.
//

import SwiftUI

import SwiftUI

struct NewsRow: View {
    let article: SportArticle

    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            AsyncImage(url: URL(string: article.urlToImage ?? "")) { image in
                image.resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.2)
            }
            .frame(width: 70, height: 90)
            .cornerRadius(10)

            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "No Title")
                    .font(.headline)
                Text(article.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
            }
        }
        .padding(.vertical, 6)
    }
}

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        return SFSafariViewController(url: url, configuration: config)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

// So we can use `.sheet(item:)`
extension URL: Identifiable {
    public var id: String { absoluteString }
}


