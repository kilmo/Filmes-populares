//
//  MovieTableViewCell.swift
//  filmes_populares
//
//  Created by Érika Moriya on 23/02/19.
//  Copyright © 2019 Érika Moriya. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var uiPoster: UIImageView?
    @IBOutlet weak var uiTitle: UILabel?
    @IBOutlet weak var uiReleaseDate: UILabel?
    @IBOutlet weak var uiRating: UILabel?
    
    private let baseImagePath = "http://image.tmdb.org/t/p/w92"
    
    func setupCell(movie: Movie){
        
        guard let rate = movie.rating, let date = movie.releaseDate, let urlString = movie.posterPath else {
            print("[MovieTableViewCell] Could'n get rate and release date")
            return
        }
        
        self.uiTitle?.text = movie.title
        self.uiRating?.text = String(describing: rate)
        self.uiReleaseDate?.text = formatDate(date: date)
        //self.uiPoster?.downloadImage(from: urlString)
        self.uiPoster?.downloadImage(from: baseImagePath + urlString)
        
    }
    
    func formatDate(date: String) -> String {
        let rawDate = date.split(separator: "-").reversed()
        return rawDate.joined(separator:"/")
    }
    
}
