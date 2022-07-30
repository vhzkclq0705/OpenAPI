//
//  ResponseMovie.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/30.
//

import Foundation

struct ResponseBoxOffice: Codable {
    let boxOfficeResult: ResponseMovies
}

struct ResponseMovies: Codable {
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case movies = "dailyBoxOfficeList"
    }
}
