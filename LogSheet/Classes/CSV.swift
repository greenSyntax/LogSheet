//
//  FileManager.swift
//  LogSheet
//
//  Created by Abhishek on 08/11/18.
//

import Foundation

class CSV {
    
    // Model => CSV String
    func encode(model: LogModel) -> String {
    
        return "\(model.identifer),\(model.name),\(model.description),\(model.type.longDescription),\(model.getTags()),\(model.createTimestamp.toString()),\(model.updateTimestamp.toString())\n"
    
    }
    
    // CSV String => Model
    func deocode(string: String) -> [LogModel] {
        
        let rows = string.split(separator: "\n")
        return rows.map { (row) -> LogModel in
            
            var logModel:LogModel = LogModel()
            
            let items = row.split(separator: ",")
            
            // Identifer
            if let element = items[safe: 0] {
                logModel.identifer = Double(element) ?? 0
            }
            
            // Name
            if let element = items[safe: 1] {
                logModel.name = String(element)
            }
            
            // Description
            if let element = items[safe: 2] {
                logModel.description = String(element)
            }
            
            // Type
            if let element = items[safe: 3] {
                logModel.type = getType(stringType: String(element))
            }
            
            // Tags
            if let element = items[safe: 4] {
                logModel.tags = getTags(String(element))
            }
            
            // Create Time Stamp
            if let element = items[safe: 5] {
                logModel.createTimestamp = String(element).toDate() ?? Date() //FIXME
            }
            
            // Update Time Stamp
            if let element = items[safe: 6] {
                logModel.updateTimestamp = String(element).toDate() ?? Date() //FIXME
            }
            
            return logModel
        }
        
    }
}

extension CSV {
    
    fileprivate func getTags(_ tags: String) -> [Tag] {
        
        var selectedTags:[Tag] = []
        
        switch tags {
        case Tag.buisnessError.rawValue:
            selectedTags.append(Tag.buisnessError)
        
        case Tag.failed.rawValue:
            selectedTags.append(Tag.failed)
            
        default:
            selectedTags.append(Tag.buisnessError) //FIXME
        }
        
        return selectedTags
    }
    
    fileprivate func getType(stringType: String) -> LogType {
        
        switch stringType.lowercased()  {
        case LogType.debug.rawValue: return LogType.debug
        case LogType.error.rawValue: return LogType.error
        case LogType.info.rawValue: return LogType.info
        case LogType.verbose.rawValue: return LogType.verbose
        case LogType.warning.rawValue: return LogType.warning
        default: return LogType.error
        }
    }
    
}
