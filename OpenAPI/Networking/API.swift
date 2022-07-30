//
//  API.swift
//  OpenAPI
//
//  Created by 권오준 on 2022/07/28.
//

import Alamofire

fileprivate func networking<T: Decodable>(
    urlStr: String,
    model: T.Type,
    completion: @escaping (Result<T, AFError>) -> Void)
{
    guard let url = URL(string: urlStr) else {
        print("URL error")
        return }
    
    AF.request(url, method: .get)
        .validate(statusCode: 200..<500)
        .responseDecodable(of: model.self) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
}

class API {
    static func searchingTodayMovies(
        _ today: String,
        completion: @escaping ([Movie]) -> Void)
    {
        networking(urlStr: Address.movies.url + today, model: ResponseMovies.self) { response in
            switch response {
            case .success(let result):
                completion(result.movies)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func searchingDetailMovie(
        _ code: String,
        completion: @escaping (Detail) -> Void)
    {
        networking(urlStr: Address.detail.url + code, model: ResponseDetail.self) { response in
            switch response {
            case .success(let result):
                completion(result.detail)
            case .failure(let error):
                print(error)
            }
        }
    }
}
