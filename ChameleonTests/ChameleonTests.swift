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
            responseData = NSData()
        }


        context("test") {

            beforeEach {
                let dataTask = session.dataTaskWithRequest(NSURLRequest()) {
                    (data, response, error) -> Void in
                    responseData = data
                }
                dataTask.resume()
            }

            it("should begin with non-nil data") {
                expect(responseData).toNot(beNil())
            }

            it("should turn the data to nil") {
                expect(responseData).toEventually(beNil())
            }

        }

    }
    
}
