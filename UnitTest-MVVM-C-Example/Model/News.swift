//
//  News.swift
//  UnitTest-MVVM-C-Example
//
//  Created by Serkan Kara on 14.01.2024.
//

import Foundation

struct News: Codable, Hashable {
    let articles: [Articles]
}

struct Articles: Codable, Hashable{
    let title: String?
    let description: String?
}
