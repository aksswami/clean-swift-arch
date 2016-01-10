//
//  CreateOrderPresenter.swift
//  ViperExample
//
//  Created by Amit kumar Swami on 09/01/16.
//  Copyright (c) 2016 Aks. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol CreateOrderPresenterInput {
    func presentExpirationDate(response: CreateOrder_FormatExpirationDate_Response)
    func presentSomething(response: CreateOrderResponse)
}

protocol CreateOrderPresenterOutput: class {
    func displayExpirationDate(viewModel: CreateOrder_FormatExpirationDate_ViewModel)
    func displaySomething(viewModel: CreateOrderViewModel)
}

class CreateOrderPresenter: CreateOrderPresenterInput {
    weak var output: CreateOrderPresenterOutput!
    let dateFormatter: NSDateFormatter = {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        return dateFormatter
    }()
    
    // MARK: Expiration date
    
    func presentExpirationDate(response: CreateOrder_FormatExpirationDate_Response)
    {
        let date = dateFormatter.stringFromDate(response.date)
        let viewModel = CreateOrder_FormatExpirationDate_ViewModel(date: date)
        output.displayExpirationDate(viewModel)
    }
    
    // MARK: Presentation logic
    
    func presentSomething(response: CreateOrderResponse)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = CreateOrderViewModel()
        output.displaySomething(viewModel)
    }
}
