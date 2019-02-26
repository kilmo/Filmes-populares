//
//  Credits.swift
//  filmes_populares
//
//  Created by Érika Moriya on 26/02/19.
//  Copyright © 2019 Érika Moriya. All rights reserved.
//

import Foundation

class Credits : Codable {
    
    let identifier: Int
    let cast: [Artist]
    let crew: [Staff]
    
    enum CodingKeys: String, CodingKey {
        case identifier         = "id"
        case cast, crew
    }
    
    init(identifier: Int, cast: [Artist], crew: [Staff]) {
        self.identifier = identifier
        self.cast = cast
        self.crew = crew
    }
    
}

class Staff : Codable {
    let creditId: String
    let department: String?
    let gender: Int
    let identifier: Int
    let job: String
    let name: String
    let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case creditId = "credit_id"
        case department, gender, job, name
        case identifier = "id"
        case profilePath = "profile_path"
    }
    
    
    init(creditId: String, department: String, gender: Int, identifier: Int, job: String, name: String, profilePath: String?) {
        self.creditId = creditId
        self.department = department
        self.gender  = gender
        self.identifier = identifier
        self.job = job
        self.name = name
        self.profilePath = profilePath
    }
}

class Artist: Codable {
    let castId: Int
    let character: String
    let creditId: String
    let gender: Int?
    let identifier: Int
    let name: String
    let order: Int?
    let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case character, name, order, gender
        case castId         = "cast_id"
        case creditId       = "credit_id"
        case identifier     = "id"
        case profilePath    = "profile_path"
    }
    
    init(castId: Int, character: String, creditId: String, gender: Int?, identifier: Int, name: String, order: Int?, profilePath: String?) {
        self.castId = castId
        self.character = character
        self.creditId = creditId
        self.gender = gender
        self.identifier = identifier
        self.name = name
        self.order = order
        self.profilePath = profilePath
    }
}
