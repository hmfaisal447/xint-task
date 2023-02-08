//
//  DataError.swift
//  xint-assignment
//
//  Created by Faisal Saleem on 02/02/2023.
//

import Foundation

enum DataError: Error, LocalizedError {
    case network(Error)
    case invalidResponse
    case invalidData
    case decoding
}

extension DataError {
    var errorDescription: String {
        switch self {
            case .network(let error):
                return error.localizedDescription
            case .invalidResponse, .invalidData:
                return "Invalid API response"
            case .decoding:
                return "Decoding Error"
        }
    }
}
