//
//  FileManager.swift
//  LogSheet
//
//  Created by Abhishek Kumar Ravi on 08/11/18.
//

import Foundation

class FileStream {
    
    private  let FILE_NAME = "logsheet"
    private  let EXTENSION = "csv"
    
    static let shared = FileStream()
    private init(){}
    
    private func getLogFilePath() -> URL? {
        if let documentPath = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) {
            
            print("Document Path: \(documentPath.absoluteString)")
            return documentPath.appendingPathComponent(FILE_NAME).appendingPathExtension(EXTENSION)
        }
        return nil
    }
    
    func read() -> String? {
        guard let logFilePath = getLogFilePath() else {return nil}
        
        do {
            return try String(contentsOf: logFilePath, encoding: .utf8)
        }
        catch let error as NSError {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func write(string: String) -> Bool {
        guard let logFilePath = getLogFilePath() else {return false}
        
        do {
            try string.write(to: logFilePath, atomically: true, encoding: .utf8)
            return true
        }
        catch let error as NSError {
            print("Error: \(error.localizedDescription)")
            return false
        }
    }
    
}
