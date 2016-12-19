//
//  Endpoint.swift
//  SyncanoSwift
//
//  Created by Jan Lipmann on 09/11/2016.
//  Copyright © 2016 Syncano. All rights reserved.
//

import Foundation
import ObjectMapper

class SocketEndpoint {
    public var name:String!
    public var method:RequestMethod!
    public var userKey:String?
    
    init(name:String, method:RequestMethod, userKey:String? = nil) {
        self.name = name
        self.method = method
        self.userKey = userKey
    }
    
    func path()->String {
        return "endpoints/\(self.name)"
    }
    
    func run(params:[String:Any]?,completionHandler:@escaping API.CompletionHandler) {
        API(userKey: userKey).request(method: method, path: path(), params: params, completionHandler: completionHandler)
    }
    
}



struct SocketResponse<T>:Mappable{
    var id: Int?
    var status:String?
    var duration:Int?
    var result:T?
    var error:String?
    var executedAt:NSDate?
    
    init?(map: Map) {
        
    }
    mutating func mapping(map: Map) {
        id <- map["id"]
        status <- map["status"]
        duration <- map["duration"]
        result <- map["result.stdout"]
        error <- map["result.stderr"]
        executedAt <- map["executed_at"]
    }
}

