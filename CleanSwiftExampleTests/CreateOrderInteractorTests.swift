//
//  CreateOrderInteractorTests.swift
//  ViperExample
//
//  Created by Amit kumar Swami on 10/01/16.
//  Copyright (c) 2016 Aks. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import XCTest

class CreateOrderInteractorTests01: XCTestCase
{
    // MARK: Subject under test
    
    var createOrderInteractor: CreateOrderInteractor!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupCreateOrderInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupCreateOrderInteractor() {
        createOrderInteractor = CreateOrderInteractor()
    }
    
    // MARK: Test doubles
    class CreateOrderInteractorOutputSpy: CreateOrderInteractorOutput {
        var presentExpirationDateCalled = false
        func presentExpirationDate(response: CreateOrder_FormatExpirationDate_Response) {
            presentExpirationDateCalled = true
        }
    }
    
    // MARK: Test expiration date
    func testFormatExpirationDateShouldAskPresenterToFormatExpirationDate() {
        let createOrderInteractorOutputSpy = CreateOrderInteractorOutputSpy()
        createOrderInteractor.output = createOrderInteractorOutputSpy
        
        let request = CreateOrder_FormatExpirationDate_Request(date: NSDate())
        createOrderInteractor.formatExpirationDate(request)
        
        XCTAssert(createOrderInteractorOutputSpy.presentExpirationDateCalled, "Formatting an expiration date should ask presenter to do it")
    }
    
    // MARK: Test shipping methods
    func testShippingMethodShouldReturnAllAvailableShippingMethod() {
        let allAvailableShippingMethod = [
            "Standard Shipping",
            "Two-Day Shipping ",
            "One-Day Shipping "
        ]
        
        let returnShippingMethod = createOrderInteractor.shippingMethods
        
        XCTAssertEqual(returnShippingMethod, allAvailableShippingMethod, "Shipping Methods should list all available shipping methods")
    }
}



