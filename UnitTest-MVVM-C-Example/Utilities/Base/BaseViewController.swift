//
//  BaseViewController.swift
//  UnitTest-MVVM-C-Example
//
//  Created by Serkan Kara on 14.01.2024.
//

import UIKit


class BaseViewController: UIViewController {
    
    let indicator = UIActivityIndicatorView()
    let backgroundView = UIView()
    
    func setupLoading() {
        backgroundView.backgroundColor = .clear
        backgroundView.frame = self.view.frame
        self.view.addSubview(backgroundView)
        backgroundView.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            indicator.heightAnchor.constraint(equalToConstant: 100),
            indicator.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func startLoading() {
        DispatchQueue.main.async { [weak self] in
            self?.setupLoading()
            self?.indicator.hidesWhenStopped = true
            self?.indicator.startAnimating()
            self?.indicator.style = .large
            self?.indicator.color = .black
            self?.indicator.tintColor = .gray
            self?.indicator.backgroundColor = .white.withAlphaComponent(0.6)
            self?.indicator.layer.cornerRadius = 10
        }
    }
    
    func stopLoading() {
        DispatchQueue.main.async { [weak self] in
            self?.indicator.stopAnimating()
            self?.indicator.removeFromSuperview()
            self?.backgroundView.removeFromSuperview()
        }
    }
}
