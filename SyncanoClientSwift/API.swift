//
//  API.swift
//  SyncanoSwift
//
//  Created by Jan Lipmann on 09/11/2016.
//  Copyright © 2016 Syncano. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

typealias RequestMethod = HTTPMethod

class API {
    
    typealias CompletionHandler = (_ response: [String:Any]? , _ error:Error?) -> Void
    
    public var userKey:String?
    
    private let baseURL = "https://api.syncano.io/v1.1/instances/"
    
    func headers() -> HTTPHeaders {
        var headers = ["Accept": "application/json"]
        if let userKey = self.userKey {
            headers["X-USER-KEY"] = userKey
        }
        return headers
    }
    
    init(userKey:String? = nil) {
        self.userKey = userKey
    }
    
    
    func get(path:String, parameters:Parameters , completionHandler:@escaping CompletionHandler) {
       return self.request(method: .get, path: path, params: parameters, completionHandler: completionHandler)
    }
    
    func post(path:String, parameters:Parameters , completionHandler:@escaping CompletionHandler) {
        return self.request(method: .post, path: path, params: parameters, completionHandler: completionHandler)
    }
    
    func put(path:String, parameters:Parameters , completionHandler:@escaping CompletionHandler) {
        return self.request(method: .put, path: path, params: parameters, completionHandler: completionHandler)
    }
    
    func patch(path:String, parameters:Parameters , completionHandler:@escaping CompletionHandler) {
        return self.request(method: .patch, path: path, params: parameters, completionHandler: completionHandler)
    }
    
    func delete(path:String, parameters:Parameters , completionHandler:@escaping CompletionHandler) {
        return self.request(method: .delete, path: path, params: parameters, completionHandler: completionHandler)
    }
    
    func request(method: HTTPMethod, path:String, params:Parameters?, completionHandler:@escaping CompletionHandler) {
        Alamofire.request(baseURL + path, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers()).validate().responseJSON { (response) in
            completionHandler(response.result.value as? [String : Any], response.result.error)
        }
    }
}
