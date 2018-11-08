//
//  LogModel.swift
//  LogSheet
//
//  Created by Abhishek on 08/11/18.
//

import Foundation

public struct LogModel {
    public var identifer: Double
    public var name: String
    public var description: String
    public var tags:[Tag]
    public var type: LogType
    public var createTimestamp: Date
    public var updateTimestamp: Date
    
    public init(){
        self.identifer = 0
        self.name = ""
        self.description = ""
        self.type = .error
        self.tags = [.buisnessError]
        self.createTimestamp = Date()
        self.updateTimestamp = Date()
    }
    
    public init(identifer: Double, name: String, description: String, tags: [Tag], type: LogType, createTimestamp: Date, updateTimestamp: Date) {
        self.identifer = identifer
        self.name = name
        self.description = description
        self.tags = tags
        self.type = type
        self.createTimestamp = createTimestamp
        self.updateTimestamp = updateTimestamp
    }
    
    public func getTags() -> String {
        var tagsInString = ""
        for tag in tags {
            tagsInString += tag.rawValue
        }
        return tagsInString
    }
}
