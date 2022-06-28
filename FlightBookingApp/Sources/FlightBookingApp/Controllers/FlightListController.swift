//
//  FlightListController.swift
//  FlightBookingApp
//
//  Created by WasiqSaleem on 28/06/2022.
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer


class FlightListController {
    func handleFlightListRequest(request: HTTPRequest, response: HTTPResponse) {
        do {
            try response.setBody(json: getFlightsList())
                .setHeader(.contentType, value: "application/json")
                .completed(status: .ok)
        } catch {
            response.setBody(string: "Something went wrong")
                .completed(status: .internalServerError)
        }
    }
}
