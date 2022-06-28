//
//  FlightDetailController.swift
//  FlightBookingApp
//
//  Created by WasiqSaleem on 28/06/2022.
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

class FlightDetailController {
    func handleFlightDetailRequest(request: HTTPRequest, response: HTTPResponse) {
        do {
            guard let flightId: Int = Int(request.urlVariables["id"] ?? "") else {
                response.setBody(string: "Something went wrong")
                    .completed(status: .badRequest)
                return
            }
            let flightDetails = getFlightsList().filter { details in
                if let id = details["id"] as? Int {
                    return id == flightId
                }
                return false
            }
            try response.setBody(json: flightDetails)
                .setHeader(.contentType, value: "application/json")
                .completed(status: .ok)
        } catch {
            response.setBody(string: "Something went wrong")
                .completed(status: .internalServerError)
        }
    }
}
