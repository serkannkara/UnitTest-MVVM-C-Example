//
//  NetworkLayer.swift
//  UnitTest-MVVM-C-Example
//
//  Created by Serkan Kara on 14.01.2024.
//

import Foundation

protocol NetworkService {
    func fetchNews(completion: @escaping (Result<News, NError>) -> Void)
}


final class NetworkServiceImpl: NetworkService {
    func fetchNews(completion: @escaping (Result<News, NError>) -> Void) {
        let urlString = "\(Constants.baseURL.rawValue)\(Constants.urlPath.rawValue)\(Constants.apiKey.rawValue)"
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidComplete))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.invalidComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do{
                let news = try JSONDecoder().decode(News.self, from: data)
                completion(.success(news))
            }catch{
                completion(.failure(.invalidComplete))
            }
            
        }.resume()
    }
}
