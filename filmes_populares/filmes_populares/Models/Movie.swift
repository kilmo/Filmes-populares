//
//  Movie.swift
//  filmes_populares
//
//  Created by Érika Moriya on 19/02/19.
//  Copyright © 2019 Érika Moriya. All rights reserved.
//

import Foundation
import UIKit

class Movie: Codable {
    
    let identifier: Int
    let title: String
    let posterPath: String?
    let releaseDate: String?
    let rating: CGFloat?
    
    enum CodingKeys: String, CodingKey {
        case identifier     = "id"
        case title
        case posterPath       = "poster_path"
        case releaseDate    = "release_date"
        case rating         = "vote_average"
    }
    
    init(identifier: Int, title: String, posterPath: String?, releaseDate: String?, rating: CGFloat?) {
        self.identifier = identifier
        self.title = title
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.rating = rating
    }
}
