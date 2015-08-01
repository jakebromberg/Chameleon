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

        let session = NSURLSession.chameleonSession(withDelegateQueue: NSOperationQueue.mainQueue())

        for _ in 0...1500 {
            runspec(withSession: session)
        }
    }

    func runspec(withSession session: NSURLSession) {



        context("test") {

            var responseData: NSData? = nil

            beforeEach {
                responseData = nil
                let request = NSURLRequest(URL: NSURL(string: "https://www.magicappfactory.com")!)
                let dataTask = session.dataTaskWithRequest(request) {
                    (data, response, error) -> Void in
                    responseData = data
                }
                dataTask.resume()
            }

            it("should begin with nil data") {
                expect(responseData).to(beNil())
            }

            it("eventually not be nil") {
                expect(responseData).toEventuallyNot(beNil())
            }

            it("should return a data object that represent the string 'blankResponse'") {
                expect(NSString(data: responseData ?? NSData(), encoding: NSUnicodeStringEncoding)).toEventually(equal("blankResponse"))
            }

        }
        
    }
    
}
