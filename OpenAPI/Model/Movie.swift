//
//  Movie.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/28.
//

import Foundation

struct Movie: Codable {
    let code: String
    let name: String
    let openDt: String
    let audiCnt: String
    let audiChange: String
    let audiAcc: String
    
    enum CodingKeys: String, CodingKey {
        case code = "movieCd"
        case name = "movieNm"
        case openDt = "openDt"
        case audiCnt, audiChange, audiAcc
    }
}
