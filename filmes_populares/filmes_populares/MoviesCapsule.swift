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
/*
 /trending/{media_type}/{time_window}
     media_type : all, movie, tv, person
     time_window : day, week
 */
    static let shared = MoviesCapsule()
    private let apiKey = "96e11fe17ace3e955e28c24454bfd5ab"
    private let trendingPath = "https://api.themoviedb.org/3/trending/movie/week?language=pt-BR&api_key="
    var moviesList: [Movie]? = []
    private let session: URLSession = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask? = nil
    
    func downloadMovies(completion: @escaping () -> Void){
        
        dataTask?.cancel()
        
        guard let listUrl = URL(string: trendingPath + apiKey) else {
            print("[MoviesCapsule] Error creating url")
            return
        }
        
        let request = URLRequest(url: listUrl, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        self.dataTask = self.session.dataTask(with: request, completionHandler: { (data, response, error) in

            if let rawData = data {
                do {
                    let decoder = JSONDecoder()
                    let rawMoviesList = try decoder.decode(MoviesList.self, from: rawData)
                    DispatchQueue.main.async {
                        self.moviesList = rawMoviesList.results
                        completion()
                    }
                    
                } catch let error {
                    completion()
                    print("-----  error:  \(error)  -----")
                }
            }

        })
        dataTask?.resume()
    }
}
