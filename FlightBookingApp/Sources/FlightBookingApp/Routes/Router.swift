//
//  Router.swift
//  FlightBookingApp
//
//  Created by WasiqSaleem on 28/06/2022.
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

func setupRouter() -> Routes {
    var routes = Routes()
    
    routes.add(method: .get, uri: "/flights") { request, response in
        FlightListController().handleFlightListRequest(request: request, response: response)
    }
    
    routes.add(method: .get, uri: "/details/{id}") { request, response in
        FlightDetailController().handleFlightDetailRequest(request: request, response: response)
    }
    
    return routes
}

