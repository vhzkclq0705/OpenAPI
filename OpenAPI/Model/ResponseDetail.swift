//
//  ResponseDetail.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/30.
//

import Foundation

struct ResponseMovieInfo: Codable {
    let movieInfoResult: ResponseDetail
}

struct ResponseDetail: Codable {
    let detail: Detail
    
    enum CodingKeys: String, CodingKey {
        case detail = "movieInfo"
    }
}
