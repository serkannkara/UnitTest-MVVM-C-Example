//
//  ResourceLoader.swift
//  UnitTest-MVVM-C-Example
//
//  Created by Serkan Kara on 15.01.2024.
//

import Foundation

class ResourceLoader {
    
    enum Resource: String {
        case news
    }
    
    static func loadNews(resource: Resource) throws -> News {
        let jsonString = """
        {
            "articles": [
                {
                    "title": "NASA wants you to help track gamma ray bursts - The Washington Post",
                    "description": "Volunteers will help researchers classify gammy ray bursts’ pulses and shapes, contributing to future research on the huge explosions."
                }
            ]
        }
        """
        
        let jsonData = jsonString.data(using: .utf8) ?? Data()
        let decoder = JSONDecoder()
        let newsResponse = try decoder.decode(News.self, from: jsonData)
        return newsResponse
    }
}
