//
//  WalkRun.swift
//  
//
//  Created by Asiel Cabrera Gonzalez on 2/18/22.
//

import FluentKit
import Vapor
import Foundation

final class WalkRun: Model, Content {
    static let schema = "WalkGpsTracking"
    
    @ID(custom: "id")
    var id: Int?
    
    @ID(custom: "uuid", generatedBy: .user)
    var uuid: String?
    
    @Field(key: "pet_id")
    var pet_id: Int?

    @Field(key: "longitude")
    var longitude: Double
    
    @Field(key: "latitude")
    var latitude: Double
    
    @Field(key: "speed")
    var speed: Double
    
    @Field(key: "bearing")
    var bearing: Double?
    
    @Field(key: "accuracy")
    var accuracy: Double
    
    @Field(key: "job_uuid")
    var job_uuid: String
    
    @Field(key: "status")
    var status: Int
    
    @Field(key: "pee")
    var pee: Int
    
    @Field(key: "poo")
    var poo: Int
    
    @Field(key: "food")
    var food: Int
    
    @Field(key: "water")
    var water: Int
    
    @Field(key: "picture")
    var picture: Int
    
    @Field(key: "video")
    var video: Int
    
    @Field(key: "typeConstant")
    var typeConstant: String
    
    @Field(key: "notes")
    var notes: String?
    
    @Timestamp(key: "created_at", on: .create)
    var created_at: Date?
    
    
    @Timestamp(key: "updated_at", on: .update)
    var updated_at: Date?
    
    init() { }
    
    init(id: Int?,
         uuid: String,
         pet_id: Int,
         longitude: Double = 0.0,
         latitude: Double = 0.0,
         speed: Double = 0.0,
         bearing: Double = 0.0,
         accuracy: Double = 0.0,
         job_uuid: String,
         status: Int = 0,
         pee: Int = 0,
         poo: Int = 0,
         food: Int = 0,
         water: Int = 0,
         picture: Int = 0,
         video: Int = 0,
         typeConstant: String = "track",
         notes: String,
         created_at: Date,
         updated_at: Date) {
        
        self.id = id
        self.uuid = uuid
        self.pet_id = pet_id
        self.longitude = longitude
        self.latitude = latitude
        self.speed = speed
        self.bearing = bearing
        self.accuracy = accuracy
        self.job_uuid = job_uuid
        self.status = status
        self.pee = pee
        self.poo = poo
        self.food = food
        self.water = water
        self.picture = picture
        self.video = video
        self.typeConstant = typeConstant
        self.notes = notes
        self.created_at = created_at
        self.updated_at = updated_at
    }
}


final class AccessZone: Model, Content {
    static let schema = "AccessZone"
    
    @ID(custom: "id")
    var id: Int?
    
    @Field(key: "uuidFriendlyConstant")
    var uuidFriendlyConstant: String
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "enabled")
    var enabled: Int
    
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
       
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    
    @Timestamp(key: "deleted_at", on: .delete)
    var deletedAt: Date?
    
    
    init() {}
    
    init(id: Int? = nil, uuidFriendlyConstant: String, name: String, enabled: Int,
         created_at: Date, updated_at: Date, deleted_at: Date
    ){
        self.id = id
        self.uuidFriendlyConstant = uuidFriendlyConstant
        self.name = name
        self.enabled = enabled
        self.createdAt = created_at
        self.updatedAt = updated_at
        self.deletedAt = deleted_at
    }
    
}
