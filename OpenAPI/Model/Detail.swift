//
//  Detail.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/30.
//

import Foundation

struct Detail: Codable {
    let name: String
    let open: String
    let type: [ShowType]
    let genre: [Genre]
    let directors: [Director]
    let actors: [Actor]
    let audits: [Audit]
    
    
    enum CodingKeys: String, CodingKey {
        case name = "movieNm"
        case open = "openDt"
        case type = "typeNm"
        case genre = "genreNm"
        case directors, actors, audits
    }
}

struct Genre: Codable {
    let genre: String
    
    enum CodingKeys: String, CodingKey {
        case genre = "genreNm"
    }
}

struct Director: Codable {
    let director: String
    
    enum CodingKeys: String, CodingKey {
        case director = "peopleNm"
    }
}

struct Actor: Codable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name = "peopleNm"
    }
}

struct ShowType: Codable {
    let type: String
    
    enum CodingKeys: String, CodingKey {
        case type = "showTypeGroupNm"
    }
}

struct Audit: Codable {
    let audit: String
    
    enum CodingKeys: String, CodingKey {
        case audit = "watchGradeNm"
    }
}
