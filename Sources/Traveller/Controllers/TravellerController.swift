//
//  BoostController.swift
//  BoostCore
//
//  Created by Ondrej Rafaj on 01/04/2018.
//

import Foundation
import Vapor
import ErrorsCore
import ApiCore


public class TravellerController: Controller {
    
    enum Error: FrontendError {
        case installMissing
        
        var code: String {
            return "boost_error"
        }
        
        var description: String {
            return "Admin team is missing! Have you run `/install` first?"
        }
        
        var status: HTTPStatus {
            return .internalServerError
        }
    }

    public static func boot(router: Router) throws {
        router.get("info") { req -> Future<Response> in
            throw Error.installMissing
        }
        
//        router.post("trips") { req -> Future<Response> in
//            
//        }
    }
    
}
