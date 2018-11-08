//
//  LogType.swift
//  LogSheet
//
//  Created by Abhishek Kumar Ravi on 08/11/18.
//

import Foundation

public enum LogType: String {
    case info = "info"
    case debug = "debug"
    case verbose = "verbose"
    case warning = "warning"
    case error = "error"
}

extension LogType {
    
    public var longDescription: String {
        switch self {
        case .info:
            return "Information"
            
        case .debug:
            return "Debug"
            
        case .verbose:
            return "Verbose"
            
        case .warning:
            return "Warning"
            
        case .error:
            return "Error"
        }
    }
}
