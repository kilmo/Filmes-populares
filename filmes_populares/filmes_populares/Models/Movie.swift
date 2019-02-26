//
//  Movie.swift
//  filmes_populares
//
//  Created by Érika Moriya on 19/02/19.
//  Copyright © 2019 Érika Moriya. All rights reserved.
//

import Foundation
import UIKit

/*
 "adult": false,
 "backdrop_path": "/xcaSYLBhmDzJ6P14bcKe0KTh3QV.jpg",
 "genre_ids": [18, 10402],
 "id": 424694,
 "original_language": "en",
 "original_title": "Bohemian Rhapsody",
 "overview": "Singer Freddie Mercury, guitarist Brian May, drummer Roger Taylor and bass guitarist John Deacon take the music world by storm when they form the rock 'n' roll band Queen in 1970. Hit songs become instant classics. When Mercury's increasingly wild lifestyle starts to spiral out of control, Queen soon faces its greatest challenge yet – finding a way to keep the band together amid the success and excess.",
 "poster_path": "/lHu1wtNaczFPGFDTrjCSzeLPTKN.jpg",
 "release_date": "2018-10-24",
 "title": "Bohemian Rhapsody",
 "video": false,
 "vote_average": 8.1,
 "vote_count": 5290,
 "popularity": 148.569
 */

class Movie: Codable {
    
    private let baseImagePath = "http://image.tmdb.org/t/p/w154"
    
    // Used now
    let identifier: Int
    let title: String
    let posterPath: String?
    let releaseDate: String?
    private let rawRating: Float?
    var rating: String {
        return formatFloatToString(number: rawRating)
    }

    // Future use
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]?
    let originalLanguage: String
    let originalTitle: String?
    let overview: String?
    let video: Bool
    let voteCount: Int?
    let popularity: Float?
    
    
    enum CodingKeys: String, CodingKey {
        case identifier         = "id"
        case title
        case posterPath         = "poster_path"
        case releaseDate        = "release_date"
        case rawRating          = "vote_average"
        
        case popularity, adult, overview, video
        case backdropPath       = "backdrop_path"
        case genreIds           = "genre_ids"
        case originalLanguage   = "original_language"
        case originalTitle      = "original_title"
        case voteCount          = "vote_count"
        
    }
    
    init(identifier: Int, title: String, posterPath: String?, releaseDate: String?, rawRating: Float?, adult: Bool, backdropPath: String?, genreIds: [Int]?, originalLanguage: String, originalTitle: String?, overview: String?, video: Bool, voteCount: Int?, popularity: Float?) {
        self.identifier = identifier
        self.title = title
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.rawRating = rawRating
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIds = genreIds
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.video = video
        self.voteCount = voteCount
        self.popularity = popularity
    }
    
    func formatFloatToString(number: Float?) -> String {
        guard let rawNumber = number else {
            return ""
        }
        let num = NSNumber(value: rawNumber)
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        if let str = formatter.string(from: num){
            return str
        }
        return ""
    }
}
