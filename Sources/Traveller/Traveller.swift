//
//  Boost.swift
//  Boost
//
//  Created by Ondrej Rafaj on 12/12/2017.
//

import Foundation
import Vapor
import ApiCore
import ErrorsCore
import Fluent
import FluentPostgreSQL
import DbCore
import SettingsCore
import MailCore


public class Traveller {
    
    public static func boot(_ app: Application) throws {
        
    }
    
    static var controllers: [Controller.Type] = [
        TravellerController.self
    ]
    
    public static func boot(router: Router) throws {
        try ApiCore.boot(router: router)
        try SettingsCore.boot(router: router)
        
        for c in controllers {
            try c.boot(router: router)
        }
    }
    
    
    public static func configure(_ config: inout Vapor.Config, _ env: inout Vapor.Environment, _ services: inout Services) throws {
        ApiAuthMiddleware.allowedGetUri.append("/info")
        
        // Register models
        DbCore.add(model: Trip.self, database: .db)
        
        // Setup dependencies
        try SettingsCore.configure(&config, &env, &services)
        try ApiCore.configure(&config, &env, &services)
    }
    
}
