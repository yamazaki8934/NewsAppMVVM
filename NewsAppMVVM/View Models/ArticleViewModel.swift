//
//  ArticleViewModel.swift
//  NewsAppMVVM
//
//  Created by 山崎浩毅 on 2019/05/14.
//  Copyright © 2019 山崎浩毅. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct ArticleListViewModel {
    let articlesVM: [ArticleViewModel]
}

extension ArticleListViewModel {
    
    init(_ articles: [Article]) {
        self.articlesVM = articles.compactMap(ArticleViewModel.init)
    }
    
}

extension ArticleListViewModel {
    
    func articleAt(_ index: Int) -> ArticleViewModel {
        return self.articlesVM[index]
    }
    
}

// This represents each single article.
struct ArticleViewModel {
    
    // have an access to the model
    let article: Article
    
    // the only way to create ArticleViewModel is if you actually pass in the article later it would assign
    // 型の整合性をとったり、メモリ安全にするためにイニシャライザを行う
    init (_ article: Article) {
        self.article = article
    }
    
    
}

extension ArticleViewModel {
    
    var title: Observable<String> {
        return Observable<String>.just(article.title)
    }
    
    var description: Observable<String> {
        return Observable<String>.just(article.description ?? "")
    }
}
