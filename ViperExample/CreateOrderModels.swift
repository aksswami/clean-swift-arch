//
//  CreateOrderModels.swift
//  ViperExample
//
//  Created by Amit kumar Swami on 09/01/16.
//  Copyright (c) 2016 Aks. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

struct CreateOrder_FormatExpirationDate_Request {
    var date: NSDate
}

struct CreateOrder_FormatExpirationDate_Response {
    var date: NSDate
}

struct CreateOrder_FormatExpirationDate_ViewModel {
    var date: String
}
