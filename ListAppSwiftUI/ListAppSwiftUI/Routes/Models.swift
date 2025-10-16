//
//  Models.swift
//  NewsReadingApp
//
//  Created by Rion on 12.9.25.
//

import Foundation
import Alamofire



// MARK: - Welcome
struct LatestNews: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [LatestArticle]?
}

// MARK: - Article
struct LatestArticle: Codable,Identifiable,Equatable{
    
   
    let source: LatestSource?
    let author, title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    
    var id: String {
           return url ?? title ?? UUID().uuidString
       }
    
    static func == (lhs: LatestArticle, rhs: LatestArticle) -> Bool {
           lhs.id == rhs.id
       }
}



// MARK: - Source
struct LatestSource: Codable {
    let id: String?
    let name: String?
}


struct GetProducts: Codable {
    let page, perPage, total, totalPages: Int
    let data: [Datum]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}
// MARK: - Datum
struct Datum: Codable {
    let id: Int?
    let email, firstName, lastName: String?
    let avatar: String?

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
struct Support: Codable {
    let url: String
    let text: String
}
//struct GetAlbums: Codable {
//    let data: DataClass
//    let support: Support
//}
//extension GetProducts {
//    init(data: Data) throws {
//        self = try JSONDecoder().decode(GetProducts.self, from: data)
//    }

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
// MARK: - Support
//struct Support: Codable {
//    let url: String
//    let text: String
//}
//
// MARK: - NewProducts
struct NewProducts: Codable {
    let id: Int
    let title: String
    let price: Int
    let description: String
    let images: [String]
    let creationAt, updatedAt: String
    let category: Productsss
}

// MARK: - Category
struct Productsss: Codable {
    let id: Int
    let name: Name
    let image: String
    let creationAt, updatedAt: At
}

enum At: String, Codable {
    case the20230209T172301000Z = "2023-02-09T17:23:01.000Z"
    case the20230209T212138000Z = "2023-02-09T21:21:38.000Z"
    case the20230210T061933000Z = "2023-02-10T06:19:33.000Z"
}

enum Name: String, Codable {
    case clothes = "Clothes"
    case electronics = "Electronics"
    case others = "Others"
    case shoes = "Shoes"
    case unNuevoNombre = "un nuevo nombre"
}

struct ShopCart: Codable {
    var id: Int?
    var name: String?
    var image: String?
    var creationAt, updatedAt: String?
}
typealias ShopCartElement = [ShopCart]

//struct News: Codable {
//    let totalArticles: Int
//    let articles: [Article]
//}

// MARK: - Article
//struct Article: Codable {
//    let title, description, content: String
//    let url: String
//    let image: String
//    let publishedAt: String
//    let source: Source
//}
//
//// MARK: - Source
//struct Source: Codable {
//    let name: String
//    let url: String
//}
//
struct ElectronicNews: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
struct AppleNews: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [AppleArticle]?
}

// MARK: - Article
struct AppleArticle: Codable {
    let source: AppleSource?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct AppleSource: Codable {
    let id: String?
    let name: String?
}
struct AirlineElement: Codable {
    let id: Double?
    let name: String
    let country: String?
    let logo: String?
    let slogan, headQuaters: String?
    let website: String?
    let established: String?

//    enum CodingKeys: String, CodingKey {
//        case id, name, country, logo, slogan
//        case headQuaters = "head_quaters"
//        case website, established
//    }
}
struct FakeStoreModelElement: Codable {
    var products : [Product]?
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int?
    let title, description: String?
    let price: Int?
    let discountPercentage, rating: Double?
    let stock: Int?
    let brand, category: String?
    let thumbnail: String?
    let images: [String]?
}
struct FakeStoreDetailsModel: Codable {
    let id: Int?
    let title, description: String?
    let price: Int?
    let discountPercentage, rating: Double?
    let stock: Int?
    let brand, category: String?
    let thumbnail: String?
    let images: [String]?
}
struct MovieModel: Codable {
    let dates: Dates
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages
        case totalResults
    }
}

struct Dates: Codable {
    let maximum, minimum: String
}

// MARK: - Result
struct Result: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: OriginalLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath
        case genreIDS
        case id
        case originalLanguage
        case originalTitle
        case overview, popularity
        case posterPath
        case releaseDate
        case title, video
        case voteAverage
        case voteCount
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case fr = "fr"
}
struct BusinessNews: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [BusinessArticle]?
}

// MARK: - Article
struct BusinessArticle: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct BusinessSource: Codable {
    let id: String?
    let name: String?
}
// MARK: - Sportnews
struct Sportnews: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [SportArticle]?
}

// MARK: - Article
struct SportArticle: Codable {
    let source: SportSource?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct SportSource: Codable {
   // let id: S?
    let name: String?
}
struct HealthNews: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [HealthArticle]?
}
// MARK: - Article
struct HealthArticle: Codable {
    let source: HealthSource?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
// MARK: - Source
struct HealthSource: Codable {
    let id: String?
    let name: String?
}
///
struct Tesla: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [TeslaArticle]?
}

// MARK: - Article
struct TeslaArticle: Codable {
    let source: Source?
    
    let author: String?
    let title:String?
    let description: String?

    let url: String?
    let urlToImage: String?
    let publishedAt: String?   
    let content: String?
}

// MARK: - Source
struct TeslaSource: Codable {
    let id: String?
    let name: String?
}

struct Bitcoin: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [BitcoinArticle]?
}

// MARK: - Article
struct BitcoinArticle: Codable {
    let source: BitcoinSource?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct BitcoinSource: Codable {
    let id: String?
    let name: String?
}
// MARK: - TechNews
struct TechNews: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [TechNewsArticle]?
}

// MARK: - Article
struct TechNewsArticle: Codable {
    let source: Source?
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct TechNewsSource: Codable {
    let id: ID?
    let name: Name?
}

enum ID: String, Codable {
    case techcrunch = "techcrunch"
}
struct USANewsModel: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [USAArticle]?
}

// MARK: - Article
struct USAArticle: Codable {
    let source: USASource?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct USASource: Codable {
    let id: String?
    let name: String?
}
