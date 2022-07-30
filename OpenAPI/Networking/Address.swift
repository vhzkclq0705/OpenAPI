//
//  Address.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/28.
//

import Foundation

fileprivate let baseURL = "https://www.kobis.or.kr/kobisopenapi/webservice/rest/"

fileprivate let key = "35a767dc1f8d7b8c71f0e15983a973fa"

enum Address {
    case movies
    case detail
    
    var url: String {
        switch self {
        case .movies:
            return baseURL + "boxoffice/searchDailyBoxOfficeList.json?key=\(key)&targetDt="
        case .detail:
            return baseURL + "/movie/searchMovieInfo.json?key=\(key)&movieCd="
        }
    }
}
