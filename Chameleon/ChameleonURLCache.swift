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

        let response = "blankResponse"
        guard let responseData = response.dataUsingEncoding(NSUnicodeStringEncoding) else { return nil }

        let urlResponse = NSURLResponse()
        let cachedResponse = NSCachedURLResponse(response: urlResponse, data: responseData)
        return cachedResponse
    }

}

extension NSURLSession {
    class func chameleonSession() -> NSURLSession {
        return NSURLSession.chameleonSession(withDelegateQueue: nil)
    }

    class func chameleonSession(withDelegateQueue delegateQueue: NSOperationQueue?) -> NSURLSession {
        return NSURLSession(configuration: NSURLSessionConfiguration.chameleonConfiguration(), delegate: nil, delegateQueue: delegateQueue)
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