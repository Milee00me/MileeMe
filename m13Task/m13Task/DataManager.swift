//
//  DataManager.swift
//  m13Task
//
//  Created by Milee Shrestha on 11/20/14.
//  Copyright (c) 2014 Milee Shrestha. All rights reserved.
//

import Foundation

class DataManager {
    
    var path = []
    
    func docFilePath(filename: String)->String? {
        
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentationDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
        
        let dir = paths[0] as String
        
        return dir.stringByAppendingPathComponent(filename)
    }
}
