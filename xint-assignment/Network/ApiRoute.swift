//
//  ApiRoute.swift
//  xint-assignment
//
//  Created by Faisal Saleem on 02/02/2023.
//

import Foundation

extension String {
    static func makeForEndpoint(_ endpoint:String) -> String{
        return "https://api.publicapis.org/"+endpoint
    }
}

enum EndPoint {
    case entries
}

extension EndPoint {
    var url : String {
        switch self {
            case .entries:
                return .makeForEndpoint("entries")
        }
    }
}

