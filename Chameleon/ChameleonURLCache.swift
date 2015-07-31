//
//  ChameleonURLCache.swift
//  Chameleon
//
//  Created by Jed Lewison on 7/31/15.
//  Copyright © 2015 Magic App Factory. All rights reserved.
//

import Foundation

class ChameleonURLCache: NSURLCache {

    override func cachedResponseForRequest(request: NSURLRequest) -> NSCachedURLResponse? {
        print(request)
        return nil
    }

}

extension NSURLSession {
    class func chameleonSession() -> NSURLSession {
        return NSURLSession(configuration: NSURLSessionConfiguration.chameleonConfiguration())
    }
}

extension NSURLSessionConfiguration {
    class func chameleonConfiguration() -> NSURLSessionConfiguration {
        let chameleonConfiguration = defaultSessionConfiguration()
        chameleonConfiguration.requestCachePolicy = .ReturnCacheDataDontLoad
        chameleonConfiguration.URLCache = ChameleonURLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: "Chameleon")
        return chameleonConfiguration
    }
}