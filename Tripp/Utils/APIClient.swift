import Alamofire
import Foundation
import Combine

class APIClient {
    let baseUrl: URL
    let baseParameters: Parameters
    
    init(baseUrl: URL, baseParameters: Parameters = [:]) {
        self.baseUrl = baseUrl
        self.baseParameters = baseParameters
    }
    
    func request<T: Codable>(method: HTTPMethod, _ uri: String, parameters: Parameters? = nil, headers: HTTPHeaders? = nil) -> AnyPublisher<T, AFError> {
        let fullUrl = baseUrl.appendingPathComponent(uri)
        var fullParameters = baseParameters
        fullParameters.mergeIn(parameters ?? [:])
        
        return AF.request(fullUrl, method: method, parameters: fullParameters, headers: headers)
            .publishDecodable(type: T.self)
            .value()
    }
}

extension APIClient {
    func get<T: Codable>(_ uri: String, parameters: Parameters? = nil, headers: HTTPHeaders? = nil) -> AnyPublisher<T, AFError> {
        request(method: .get, uri, parameters: parameters, headers: headers)
    }
    
    // ...
}
