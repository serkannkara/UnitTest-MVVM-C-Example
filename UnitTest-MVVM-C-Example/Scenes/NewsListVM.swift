//
//  NewsListVM.swift
//  UnitTest-MVVM-C-Example
//
//  Created by Serkan Kara on 14.01.2024.
//

import Foundation

protocol NewsListVM {
    func load()
    var delegate: NewsListVMDelegate? { get set }
}

protocol NewsListVMDelegate: AnyObject {
    func handleOutput(output: UserInteraction)
}

final class NewsListVMImpl: NewsListVM {
    
    private var service: NetworkService
    weak var delegate: NewsListVMDelegate?
    private var news: News?
    
    init(service: NetworkService) {
        self.service = service
    }
    
    func load() {
        notify(.showLoading(true))
        service.fetchNews { [weak self] result in
            self?.notify(.showLoading(false))
            switch result {
            case .success(let news):
                self?.news = news
                self?.notify(.newsList(news))
            case .failure:
                break
            }
        }
    }
    
    private func notify(_ output: UserInteraction) {
        delegate?.handleOutput(output: output)
    }
}

enum UserInteraction: Equatable {
    case newsList(News)
    case showLoading(Bool)
}
