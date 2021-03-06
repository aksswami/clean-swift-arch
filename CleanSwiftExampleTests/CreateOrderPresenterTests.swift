//
//  CreateOrderPresenterTests.swift
//  ViperExample
//
//  Created by Amit kumar Swami on 10/01/16.
//  Copyright (c) 2016 Aks. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import XCTest

class CreateOrderPresenterTests: XCTestCase
{
    // MARK: Subject under test
    
    var createOrderPresenter: CreateOrderPresenter!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupCreateOrderPresenter()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupCreateOrderPresenter()
    {
        createOrderPresenter = CreateOrderPresenter()
    }
    
    // MARK: Test doubles
    class CreateOrderPresenterOutputSpy: CreateOrderPresenterOutput {
        var displayExpirationDateCalled = false
        
        var createOrder_formatExpirationDate_viewModel: CreateOrder_FormatExpirationDate_ViewModel!
        
        func displayExpirationDate(viewModel: CreateOrder_FormatExpirationDate_ViewModel) {
            displayExpirationDateCalled = true
            createOrder_formatExpirationDate_viewModel = viewModel
        }
        
    }
    
    class CreateOrderPresenterOutputMock: CreateOrderPresenterOutput {
        var displayExpirationDateCalled = false
        
        var createOrder_formatExpirationDate_viewModel: CreateOrder_FormatExpirationDate_ViewModel!
        
        func displayExpirationDate(viewModel: CreateOrder_FormatExpirationDate_ViewModel) {
            displayExpirationDateCalled = true
            createOrder_formatExpirationDate_viewModel = viewModel
        }
        
        func verifyDisplayExpirationDateIsCalled() -> Bool {
            return displayExpirationDateCalled
        }
        
        func verifyExpirationDateIsFormattedAs(date: String) -> Bool {
            return createOrder_formatExpirationDate_viewModel.date == date
        }
        
    }
    
    // MARK: Tests
    func testPresentExpirationDateShouldConvertDateToString() {
        // Given
        let createOrderPresenterOutputSpy = CreateOrderPresenterOutputSpy()
        createOrderPresenter.output = createOrderPresenterOutputSpy
        
        let dateComponents = NSDateComponents()
        dateComponents.year = 2007
        dateComponents.month = 6
        dateComponents.day = 14
        let date = NSCalendar.currentCalendar().dateFromComponents(dateComponents)!
        let response = CreateOrder_FormatExpirationDate_Response(date: date)
        
        // When
        createOrderPresenter.presentExpirationDate(response)
        
        // Then
        let returnedDate = createOrderPresenterOutputSpy.createOrder_formatExpirationDate_viewModel.date
        let expectedDate = "6/14/07"
        
        XCTAssertEqual(returnedDate, expectedDate, "Presenting an expiration date should convert date to string")
    }
    
    func testPresentExpirationDateShouldAskViewControllerToDisplayDateString() {
        // Given
        let createOrderPresenterOutputSpy = CreateOrderPresenterOutputSpy()
        createOrderPresenter.output = createOrderPresenterOutputSpy
        let response = CreateOrder_FormatExpirationDate_Response(date: NSDate())
        
        // When
        createOrderPresenter.presentExpirationDate(response)
        
        // Then
        XCTAssert(createOrderPresenterOutputSpy.displayExpirationDateCalled, "Presenting an expiration date should ask view controller to display date string")
    }
    
    
    // MARK: Tests
    func testPresentExpirationDateShouldConvertDateToStringMock() {
        // Given
        let createOrderPresenterOutputMock = CreateOrderPresenterOutputMock()
        createOrderPresenter.output = createOrderPresenterOutputMock
        
        let dateComponents = NSDateComponents()
        dateComponents.year = 2007
        dateComponents.month = 6
        dateComponents.day = 14
        let date = NSCalendar.currentCalendar().dateFromComponents(dateComponents)!
        let response = CreateOrder_FormatExpirationDate_Response(date: date)
        
        // When
        createOrderPresenter.presentExpirationDate(response)
        
        // Then
        let expectedDate = "6/14/07"
        
        XCTAssert(createOrderPresenterOutputMock.verifyExpirationDateIsFormattedAs(expectedDate), "Presenting an expiration date should convert date to string")
    }
    
    func testPresentExpirationDateShouldAskViewControllerToDisplayDateStringMock() {
        // Given
        let createOrderPresenterOutputMock = CreateOrderPresenterOutputMock()
        createOrderPresenter.output = createOrderPresenterOutputMock
        let response = CreateOrder_FormatExpirationDate_Response(date: NSDate())
        
        // When
        createOrderPresenter.presentExpirationDate(response)
        
        // Then
        XCTAssert(createOrderPresenterOutputMock.verifyDisplayExpirationDateIsCalled(), "Presenting an expiration date should ask view controller to display date string")
    }

}
