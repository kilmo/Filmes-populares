//
//  Movie.swift
//  filmes_populares
//
//  Created by Érika Moriya on 19/02/19.
//  Copyright © 2019 Érika Moriya. All rights reserved.
//

import Foundation
import UIKit

class Movie {
    
    let name: String
    let imageURL: URL?
    let releaseDate: Date
    let rating: Int?
    
    init(name: String, imageURL: URL?, date: Date, rating: Int?) {
        self.name = name
        self.imageURL = imageURL
        self.releaseDate = date
        self.rating = rating
    }
}
