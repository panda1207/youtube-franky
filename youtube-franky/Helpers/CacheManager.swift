//
//  CacheManager.swift
//  youtube-franky
//
//  Created by franky on 09/09/2021.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        
        return cache[url]
    }
}
