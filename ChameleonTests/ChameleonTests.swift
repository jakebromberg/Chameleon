//
//  ChameleonTests.swift
//  ChameleonTests
//
//  Created by Jed Lewison on 7/31/15.
//  Copyright © 2015 Magic App Factory. All rights reserved.
//

import Quick
import Nimble
@testable import Chameleon

class ChameleonTests: QuickSpec {

    override func spec() {

        var session: NSURLSession! = nil
        var responseData: NSData? = nil

        beforeEach {
            session = NSURLSession.chameleonSession()
            responseData = nil
        }


        context("test") {

            beforeEach {
                let request = NSURLRequest(URL: NSURL(string: "https://www.magicappfactory.com")!)
                let dataTask = session.dataTaskWithRequest(request) {
                    (data, response, error) -> Void in
                    responseData = data
                    print("response? \(response)")
                    print("error? \(error)")
                }
                dataTask.resume()
            }

            it("should begin with nil data") {
                expect(responseData).to(beNil())
            }

            it("should return a data object that represent the string 'blankResponse'") {
                expect(NSString(data: responseData ?? NSData(), encoding: NSUnicodeStringEncoding)).toEventually(equal("blankResponse"))
            }

        }

    }
    
}
