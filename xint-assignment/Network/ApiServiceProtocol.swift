//
//  ApiServiceProtocol.swift
//  xint-assignment
//
//  Created by Faisal Saleem on 02/02/2023.
//

import Foundation

typealias Completion<T> = (Result<T, DataError>) -> Void

enum HttpMethod {
    case post
    case get
    case put
}

extension HttpMethod {
    var method: String {
        switch self {
        case .post:
            return "POST"
        case .get:
            return "GET"
        case .put:
            return "PUT"
        }
    }
}

protocol ApiServiceProtocol {
    func getApiRequest<T: Decodable>(completion: @escaping Completion<T>)
}
