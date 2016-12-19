//
//  DataObject.swift
//  SyncanoSwift
//
//  Created by Jan Lipmann on 12/11/2016.
//  Copyright © 2016 Syncano. All rights reserved.
//

import Foundation
import ObjectMapper

enum DataObjectPermissionType:String {
    case None
    case Read
    case Write
    case Full
    case NotSet
}

class DataObject: Mappable {
    var id:Int?
    var createdAt:NSDate?
    var updatedAt:NSDate?
    var revision:Int?
    var links:[String:AnyObject]?
    var channelRoom:String?
    var channel:String?
    var group:Int?
    var owner:Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        createdAt <- map["created_at"]
        updatedAt <- map["updated_at"]
        revision <- map["revision"]
        links <- map["links"]
        channelRoom <- map["channel_room"]
        channel <- map["channel"]
        group <- map["group"]
        owner <- map["owner"]
    }
}
