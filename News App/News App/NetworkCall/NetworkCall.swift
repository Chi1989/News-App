//
//  NetworkCall.swift
//  News App
//
//  Created by Decagon on 05/08/2022.
//

import Foundation

//MARK: - API CALL
class NewsApi {
    static let shared = NewsApi()
    let session  = URLSession.shared
    let api = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2022-08-03&to=2022-08-03&sortBy=popularity&apiKey=43f8588a8eb84de9a52f86b8144db065")
    public init() {}
    
    func getNews(completion: @escaping (Result<[ArticleModel], Error>) -> Void) {
        guard let url = api else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(error!))
            } else if data != nil {
                do {
                    let result = try? JSONDecoder().decode(NewsModel.self, from: data!)
                    print("articles: \(result!.articles.count)")
                    completion(.success(result!.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
