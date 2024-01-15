//
//  APISettings.swift
//  UnitTest-MVVM-C-Example
//
//  Created by Serkan Kara on 14.01.2024.
//

import Foundation

enum Constants: String {
    case baseURL = "https://newsapi.org"
    case urlPath = "/v2/top-headlines?country=us&apiKey="
    case apiKey = "64e79656aaf345428ffdaed1015a2dd9"
}

enum NError: String, Error{
    case invalidData = "The data received from the server was invalid. Please try again"
    case invalidResponse = "iInvalid response from the server. Please try again."
    case invalidComplete = "Unable to complete your request. Please check your internet connection"
}

