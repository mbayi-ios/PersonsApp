//
//  NetworkingManager.swift
//  PersonsApp
//
//  Created by Amby on 20/12/2022.
//

import Foundation

final class NetworkingManager {
    static let shared = NetworkingManager()

    private init() {}

    func request<T: Codable>(_ endpoint: Endpoint, type: T.Type) async throws -> T {
        guard let url = endpoint.url else {
            throw NetworkingError.invalidUrl
        }

        let request = buildRequest(from: url, methodType: endpoint.methodType)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let response = response as? HTTPURLResponse,
              (200...300) ~= response.statusCode else {
                  let statusCode = (response as! HTTPURLResponse).statusCode
                  throw NetworkingError.invalidStatusCode(StatusCode: statusCode)
              }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let res = try decoder.decode(T.self, from: data)
        return res

    }

    func request(_ endpoint: Endpoint) async throws {
        guard let url = endpoint.url else {
            throw NetworkingError.invalidUrl
        }
        let request = buildRequest(from: url, methodType: endpoint.methodType)

        let (_, response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse,
              (200...300) ~= response.statusCode else  {
                  let statusCode = (response as! HTTPURLResponse).statusCode
                  throw NetworkingError.invalidStatusCode(StatusCode: statusCode)
              }
    }
}


extension NetworkingManager {
    enum NetworkingError: LocalizedError {
        case invalidUrl
        case custom(error: Error)
        case invalidStatusCode(StatusCode: Int)
        case invalidData
        case failedToDecode(error: Error)
    }
}

extension NetworkingManager.NetworkingError {
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "url isnt valid"

        case .invalidStatusCode:
            return "Status code falls into the wrong range"

        case .invalidData:
            return "response data is invalid"

        case .failedToDecode:
            return "failed to decode"

        case .custom(let err):
            return "something went wrong \(err.localizedDescription)"
        }
    }
}

extension NetworkingManager {
    enum MethodType {
        case GET
        case POST(data: Data?)
    }
}


private extension NetworkingManager {
    func buildRequest(from url: URL, methodType: Endpoint.MethodType) -> URLRequest {
        var request = URLRequest(url: url)

        switch methodType {
        case .GET:
            request.httpMethod = "GET"
        case .POST(let data):
            request.httpMethod = "POST"
            request.httpBody = data

        }
        return request
    }
}
