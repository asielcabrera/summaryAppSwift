//
//  CreateWalkRun.swift
//  
//
//  Created by Asiel Cabrera Gonzalez on 2/18/22.
//

import Fluent

struct CreateWalkRun: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("WalkGpsTracking")
            .id()
            .field("uuid", .uuid, .required)
            .field("pet_id", .uuid, .required)
            .field("longitude", .double, .required)
            .field("latitude", .double, .required)
            .field("speed", .double, .required)
            .field("bearing", .double, .required)
            .field("accuracy", .double, .required)
            .field("job_uuid", .uuid, .required)
            .field("status", .int8, .required)
            .field("pee", .int8, .required)
            .field("poo", .int8, .required)
            .field("food", .int8, .required)
            .field("water", .int8, .required)
            .field("picture", .int8, .required)
            .field("video", .int8, .required)
            .field("typeConstant", .string, .required)
            .field("notes", .string, .required)
            .field("created_at", .datetime, .required)
            .field("updated_at", .datetime, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("todos").delete()
    }
}


