//
//  Trip.swift
//  App
//
//  Created by Ondrej Rafaj on 11/12/2017.
//

import Foundation
import Vapor
import Fluent
import FluentPostgreSQL
import DbCore
import ApiCore


public typealias Trips = [Trip]


final public class Trip: DbCoreModel {
    
    public struct New: Codable {
        public var name: String
        public var date: Date?
    }
    
    public var id: DbCoreIdentifier?
    public var name: String
    public var date: Date?
    public var teamId: DbCoreIdentifier
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case date
        case teamId = "team_id"
    }
    
    public init(id: DbCoreIdentifier? = nil, teamId: DbCoreIdentifier, name: String, date: Date? = nil) {
        self.id = id
        self.teamId = teamId
        self.name = name
        self.date = date
    }
    
    public init(new: New, teamId: DbCoreIdentifier) {
        self.teamId = teamId
        self.name = new.name
        self.date = new.date
    }
    
}

// MARK: - Relations

extension Trip {
    
    public var team: Parent<Trip, Team> {
        return parent(\.teamId)
    }
    
}

// MARK: - Migrations

extension Trip: Migration {
    
    public static func prepare(on connection: DbCoreConnection) -> Future<Void> {
        return Database.create(self, on: connection) { (schema) in
            schema.addField(type: DbCoreColumnType.id(), name: CodingKeys.id.stringValue, isIdentifier: true)
            schema.addField(type: DbCoreColumnType.id(), name: CodingKeys.teamId.stringValue)
            schema.addField(type: DbCoreColumnType.varChar(60), name: CodingKeys.name.stringValue)
            schema.addField(type: DbCoreColumnType.datetime(), name: CodingKeys.date.stringValue, isOptional: true)
        }
    }
    
    public static func revert(on connection: DbCoreConnection) -> Future<Void> {
        return Database.delete(Trip.self, on: connection)
    }
    
}
