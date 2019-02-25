//
//  MoviesCapsule.swift
//  filmes_populares
//
//  Created by Érika Moriya on 23/02/19.
//  Copyright © 2019 Érika Moriya. All rights reserved.
//

import Foundation
import UIKit
import TMDBSwift

class MoviesCapsule{

    static let shared = MoviesCapsule()
    private let apiKey = "96e11fe17ace3e955e28c24454bfd5ab"
    
    var moviesList: MoviesList?
    
    func setupConfigCapsule(){
        TMDBConfig.apikey = apiKey
    }
    
    func downloadMoviesList(page: Int, completionHandler: @escaping () -> ()){
        MovieMDB.popular(language: "pt-BR", page: page) { (client, movieList) in
            
            if let json = client.json,  let totalPages = json.dictionaryObject?["total_pages"] as? Int, let totalResults = json.dictionaryObject?["total_results"] as? Int, let rawResult = json.dictionaryObject?["results"] as? [[String:Any]] {
                
                let result = self.transformToArrayMovie(array: rawResult)
                let list = MoviesList(page: page, results: result, totalPages: totalPages, totalResults: totalResults)
                self.moviesList = list
                completionHandler()
            }
        }
    }
    
    func transformToArrayMovie(array: [[String: Any]]) -> [Movie]{
        
        var movies: [Movie] = []
        
        for obj in array {
            var dict: [String: Any] = [:]
            for item in obj {
                dict[item.key] = item.value
            }
            if let id = dict["id"] as? Int, let title = dict["title"] as? String, let posterPath = dict["poster_path"] as? String, let releaseDate = dict["release_date"] as? String, let adult = dict["adult"] as? Bool, let originalLanguage = dict["original_language"] as? String, let video = dict["video"] as? Bool {
            
            
            movies.append(Movie(identifier: id, title: title, posterPath: posterPath, releaseDate: releaseDate, rating: dict["vote_average"] as? CGFloat, adult: adult, backdropPath: dict["backdrop_path"] as? String, genreIds:  dict["genre_ids"] as? [Int], originalLanguage: originalLanguage, originalTitle: dict["original_title"] as? String, overview: dict["overview"] as? String, video: video, voteCount: dict["vote_count"] as? Int, popularity: dict["popularity"] as? Int))
            }
        }
        return movies
    }
}
