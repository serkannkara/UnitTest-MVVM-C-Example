//
//  NewsListVC.swift
//  UnitTest-MVVM-C-Example
//
//  Created by Serkan Kara on 14.01.2024.
//

import UIKit

class NewsListVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: NewsListVM?
    var news: News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        viewModel?.load()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func inject(vm: NewsListVM) {
        self.viewModel = vm
    }
}

extension NewsListVC: NewsListVMDelegate {
    func handleOutput(output: UserInteraction) {
        switch output {
        case .newsList(let news):
            DispatchQueue.main.async { [weak self] in
                self?.news = news
                self?.tableView.reloadData()
            }
        case .showLoading(let isLoading):
            isLoading ? startLoading() : stopLoading()
        }
    }
}

extension NewsListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = news?.articles[indexPath.row].title
        return cell
    }
}

extension NewsListVC: UITableViewDelegate { }
