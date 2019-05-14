//
//  Article.swift
//  NewsAppMVVM
//
//  Created by 山崎浩毅 on 2019/05/14.
//  Copyright © 2019 山崎浩毅. All rights reserved.
//

import Foundation

struct ArticleResponse: Decodable {
    let article: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
}
