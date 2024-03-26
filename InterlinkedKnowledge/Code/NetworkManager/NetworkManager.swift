//
//  NetworkManager.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 26/3/2024.
//

import Foundation

struct CurrencyResult: Codable {
    let resultIdItem: Int
    let resultCurrencyItem: String
    let resultBuyItem: Int
    let resultSellItem: Int
    let resultCreated_atItem: String
    let resultUpdated_atItem: String
}

struct CurrencyResponse: Codable {
    let results: [CurrencyResult]?
}

let currencies = ["AUDUSD", "EURUSD", "GBPUSD", "NZDUSD", "USDCAD", "USDCHF", "USDJPY"]

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    let baseURL = URL(string: "https://vivalid.space/api/v2/fetch/currencies?token=76764ed2-495d-44ce-be1f-1e19df324454")!

    func getCurrencyRatio(completion: @escaping (Result<[CurrencyResult], Error>) -> Void) {
        var request = URLRequest(url: baseURL)

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NSError(domain: "NetworkError", code: 0, userInfo: nil)))
                return
            }

            do {
                let decoder = JSONDecoder()
                let currencyResponse = try decoder.decode(CurrencyResponse.self, from: data)

                print("Response:")
                print(currencyResponse)

                // Filter results based on currencies array
                let filteredResults = currencyResponse.results?.filter { currencies.contains($0.resultCurrencyItem) } ?? []

                completion(.success(filteredResults))
            } catch {
                print("Error decoding response: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}

