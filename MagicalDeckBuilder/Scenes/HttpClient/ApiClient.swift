//
//  ApiClient.swift
//  MagicalDeckBuilder
//
//  Created by Roberto Evangelista on 19/02/23.
//

import Foundation

final class ApiClient {
    
    private let baseUrl = URL(string: "https://api.magicthegathering.io/v1/cards")!
    
    func fetchCards(completion: @escaping (Result<[Card], ClientError>) -> Void) {
        let request = URLRequest(url: baseUrl)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(.failure(.invalidRequest))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.unexpected))
                return
            }
            
            guard let data else {
                completion(.failure(.unexpected))
                return
            }
            
            do {
                let cards = try JSONDecoder().decode(CardsResponse.self, from: data)
                completion(.success(cards.cards))
            } catch let decodingError as DecodingError {
                print(decodingError)
                completion(.failure(.unexpected))
            } catch {
                completion(.failure(.unexpected))
            }
        }
        
        task.resume()
    }
}
