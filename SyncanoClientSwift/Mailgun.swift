//
//  Chat.swift
//  SyncanoSwift
//
//  Created by Jan Lipmann on 08/12/2016.
//  Copyright © 2016 Syncano. All rights reserved.
//

import Foundation
import ObjectMapper


extension Syncano {
    public func sendEmail<T:Mappable>(email:String, subject:String, message:String, callback:@escaping (_ response:T?,_ error:Error?) -> Void) {
        let socket = SocketEndpoint(name: "send_email", method: .post, userKey:self.userKey)
        let params:[String:Any] = ["email" : email,"subject" : subject,"message" : message]
        socket.run(params: params) { (response, error) in
            if let value = response{
                if let res = Mapper<T>().map(JSON: value) {
                    callback(res,error)
                }
                callback(nil,error)
            }
        }
    }
}

