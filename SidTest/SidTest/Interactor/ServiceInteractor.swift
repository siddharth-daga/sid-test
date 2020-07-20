//
//  ServiceInteractor.swift
//  SidTest
//
//  Created by Backup on 20/07/20.
//  Copyright © 2020 Backup. All rights reserved.
//

import Foundation

struct ServiceInteractor {
    
    private var resourceType: RequestResourceType
    private var parameters: [ParameterKeys: String] = [:]
    private var httpBody: Data?
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase
    
    init(resourceType: RequestResourceType, params: [ParameterKeys: String] = [:]) {
        self.resourceType = resourceType
        self.parameters = params
    }
    
    init<T: Encodable>(resourceType: RequestResourceType, params: [ParameterKeys: String] = [:], object: T) {
        self.resourceType = resourceType
        self.parameters = params
        self.httpBody = try? JSONEncoder().encode(object)
    }
    
    var baseURL: String {
        
        var urlStr: String?
        
        switch self.resourceType {
        case .getArticleListing:
            urlStr = FireBaseConfig.shared.getArticleListingApi
        case .none:
            break
        }
        
        urlStr = urlStr?.replacingOccurrences(of: ParameterKeys.baseUrl.rawValue, with: FireBaseConfig.shared.baseUrl ?? "")
        
        for parameter in parameters {
            urlStr = urlStr?.replacingOccurrences(of: parameter.key.rawValue, with: parameter.value)
        }
        
        return urlStr?.trimmingCharacters(in: CharacterSet.whitespaces) ?? ""
    }
    
    var httpMethod: String {
        switch self.resourceType {
        default:
            return "GET"
        }
    }
    
    func getResult<U: Codable>(object: U.Type, completion: ((_ response: Codable?, _ error: Error?) -> ())?) {
        guard let url = URL(string: self.baseURL) else {
            completion?(nil, nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod
        
        if let httpBody = self.httpBody {
            request.httpBody = httpBody
        }
        
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            self.dubugPrint(request: request, response: response, responseBody: data, error: error)
            var parsedResponse:U?
            var parseError: Error?
            
            guard let dataResponse = data,
                error == nil else {
                    parseError = error
                    completion?(nil, parseError)
                    return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = self.keyDecodingStrategy
                parsedResponse = try decoder.decode(object, from: dataResponse)
            } catch let parsingError {
                parseError = parsingError
                if self.debugLogging { print(parseError ?? parsingError) }
            }
            
            DispatchQueue.main.async {
                completion?(parsedResponse, parseError)
            }
        }
        task.resume()
    }
    
    var debugLogging = true
    private func dubugPrint(request: URLRequest?, response: URLResponse?, responseBody: Data?, error: Error?) {
        if debugLogging == false {
            return
        }
        print("============================================")
        if let request = request {
            print("Request:\n\(request)")
        }
        if let requestHeaders = request?.allHTTPHeaderFields {
            print("RequestHeaders:\n\(requestHeaders)")
            
        }
        if let requestMethod = request?.httpMethod {
            print("RequestMethod:\n\(requestMethod)")
        }
        if let requestBody = request?.httpBody {
            print("RequestBody:\n\(String(data: requestBody, encoding: String.Encoding.utf8) ?? "")")
        }
        print("--------------------------------------------")
        if let response = response {
            print("Response:\n\(response.url?.absoluteString ?? "")")
        }
        if let response = response as? HTTPURLResponse {
            print("ResponseHeaders:\n\((response.allHeaderFields as? [String: String]) ?? [String: String]())")
        }
        if let responseBody = responseBody {
            print("ResponseBody:\n\(String(data: responseBody, encoding: String.Encoding.utf8) ?? "")")
        }
        if let error = error {
            print("ResponseError:\n\(error))")
        }
        print("============================================")
    }
}
