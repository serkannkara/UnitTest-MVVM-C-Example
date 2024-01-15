//
//  MockNewsListService.swift
//  UnitTest-MVVM-C-Example
//
//  Created by Serkan Kara on 15.01.2024.
//

import Foundation

final class MockNewsListService: NetworkService {
    var news = News(articles: [Articles(title: "NASA wants you to help track gamma ray bursts - The Washington Post",
                                        description: "Volunteers will help researchers classify gammy ray bursts’ pulses and shapes, contributing to future research on the huge explosions.")])
    func fetchNews(completion: @escaping (Result<News, NError>) -> Void) {
        completion(.success(news))
    }
}


