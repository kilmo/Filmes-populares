//
//  MoviesCapsule.swift
//  filmes_populares
//
//  Created by Érika Moriya on 23/02/19.
//  Copyright © 2019 Érika Moriya. All rights reserved.
//

import Foundation
import UIKit

class MoviesCapsule {

    static let shared = MoviesCapsule()
    
    private let apiKey = "96e11fe17ace3e955e28c24454bfd5ab"
    private let baseURL = "https://api.themoviedb.org/3/movie/"
    private let popularPath = "popular?language=pt-BR&api_key="
    private let creditPath = "/credits?language=pt-BR&api_key="
    
    var moviesList: MoviesList?
    var credits: Credits?
    var allMovies: [Movie] = []
    
    private let session: URLSession = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask? = nil
    
    func downloadMovies(page: Int, completion: @escaping () -> Void){
        dataTask?.cancel()
        
        guard let listUrl = URL(string: baseURL + popularPath + apiKey + "&page:\(String(describing: page))") else {
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
                        
                        if rawMoviesList.page > self.moviesList?.page ?? 0 {
                            self.allMovies += rawMoviesList.results
                        }
                        
                        self.moviesList = rawMoviesList
                        completion()
                    }
                    
                } catch let error {
                    print("-----  error:  \(error)  -----")
                    completion()
                }
            }
            
        })
        dataTask?.resume()
    }
    
    func downloadCredits(movieId: Int, completion: @escaping () -> Void){
        dataTask?.cancel()
        
        guard let listUrl = URL(string:baseURL + movieId.description + creditPath + apiKey) else {
            print("[MoviesCapsule] Error creating url")
            return
        }
        
        let request = URLRequest(url: listUrl, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        self.dataTask = self.session.dataTask(with: request, completionHandler: { (data, response, error) in
            
            if let rawData = data {
                do {
                    let decoder = JSONDecoder()
                    let rawCredits = try decoder.decode(Credits.self, from: rawData)
                    DispatchQueue.main.async {
                        self.credits = rawCredits
                        completion()
                    }
                    
                } catch let error {
                    print("-----  error:  \(error)  -----")
                    completion()
                }
            }
            
        })
        dataTask?.resume()
    }
    
}
