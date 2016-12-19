//
//  SyncanoExample.swift
//  SyncanoSwift
//
//  Created by Jan Lipmann on 14/12/2016.
//  Copyright © 2016 Syncano. All rights reserved.
//

import Foundation


class SyncanoExample {
    func sendMail() {
        let s = Syncano(instanceName: "INSTANCE_NAME")
        s.sendEmail(email: "jan.lipmann@syncano.com", subject: "SUBJECT", message: "MESSAGE") { (response:SocketResponse<String>?, error) in
        
        }
    }
}
