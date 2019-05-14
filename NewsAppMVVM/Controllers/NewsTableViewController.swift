//
//  NewsTableViewController.swift
//  NewsAppMVVM
//
//  Created by 山崎浩毅 on 2019/05/14.
//  Copyright © 2019 山崎浩毅. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

final class NewsTableViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
    }

    
    private func populateNews() {
        
        let resource = Resource<ArticleResponse>(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=8048e5b29213444cbf9e4b977a9f74a1")!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: {
                print($0)
            }).disposed(by: disposeBag)
        
    }
}
