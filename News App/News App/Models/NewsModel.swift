//
//  NewsModel.swift
//  News App
//
//  Created by Decagon on 05/08/2022.
//

import Foundation

struct NewsModel: Decodable {
    let articles: [ArticleModel]
}

struct ArticleModel: Decodable {
    let title: String
    let description: String?
    let url: String
}
