//
//  SwiftUIView.swift
//  
//
//  Created by Asiel Cabrera Gonzalez on 2/18/22.
//

import Fluent
import Vapor

struct WalkRunController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let walkRun = routes.grouped("walkrun")
        walkRun.get(use: index)
        walkRun.post(use: create)
        walkRun.group(":todoID") { todo in
            todo.delete(use: delete)
        }
    }
    
    func index(req: Request) throws -> EventLoopFuture<[WalkRun]> {
        return WalkRun.query(on: req.db).all()
    }
    
    func create(req: Request) throws -> EventLoopFuture<WalkRun> {
        let walkRun = try req.content.decode(WalkRun.self)
        return walkRun.save(on: req.db).map { walkRun }
    }
    
    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return WalkRun.find(req.parameters.get("job_uuid"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}



