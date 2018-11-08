//
//  LogSheet.swift
//  LogSheet
//
//  Created by Abhishek on 08/11/18.
//

import Foundation

public class LogSheet {
    
    public static let instance = LogSheet()
    private init() {
    }
    
    public func read(_ identifier: Double? = nil) -> [LogModel]? {
        
        // Read Particular LogID
        if let logId = identifier {
            if let readData = FileStream.shared.read() {
                return CSV().deocode(string: readData).filter { (log) -> Bool in
                    return log.identifer == logId ? true : false
                }
            }
        }
        else {
            if let readData = FileStream.shared.read() {
                return CSV().deocode(string: readData)
            }
        }
        
        return nil
    }
    
    public func write(log: LogModel) -> Bool {
        
        var existingData = ""
        
        if let text = FileStream.shared.read() {
           existingData = text
        }
        
        return FileStream.shared.write(string: "\(existingData)\(CSV().encode(model: log))")
    }
    
    //TODO:
    public func update(identifier: String) {
        
    }
    
    //TODO:
    public func delete(identifier: String) {
        
    }

}

extension LogSheet {

    func export() -> URL? {
        return nil
    }
    
}

