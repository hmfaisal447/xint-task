//
//  ApiService.swift
//  xint-assignment
//
//  Created by Faisal Saleem on 02/02/2023.
//

import Foundation

class ApiService: ApiServiceProtocol {
    
    func makeUrlRequest() -> URLRequest? {
        let endpoint = EndPoint.entries.url
        let httpMethod: HttpMethod = .get
        guard let url = URL(string: endpoint) else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.method
        return request
    }
    
    func getApiRequest<T: Decodable>(completion: @escaping Completion<T>) {
        guard let request = self.makeUrlRequest() else {return}
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.network(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let data = try JSONDecoder().decode(T.self, from: data)
                completion(.success(data))
            } catch {
                completion(.failure(.decoding))
            }
        }.resume()
    }
}
