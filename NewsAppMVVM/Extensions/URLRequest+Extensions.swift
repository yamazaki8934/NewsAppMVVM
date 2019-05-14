//
//  URLRequest+Extensions.swift
//  NewsAppMVVM
//
//  Created by 山崎浩毅 on 2019/05/14.
//  Copyright © 2019 山崎浩毅. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// 色んなタイプのAPIを叩く可能性を考慮してジェネリクスで実装
struct Resource<T: Decodable> {
    let url: URL
}

extension URLRequest {
    
    static func load<T>(resource: Resource<T>) -> Observable<T> {
        
        return Observable.just(resource.url)
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            }.map { data -> T in
                return try JSONDecoder().decode(T.self, from: data)
        }
    
    }

}

