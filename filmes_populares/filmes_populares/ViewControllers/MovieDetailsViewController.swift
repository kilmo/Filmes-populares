//
//  MovieDetailsViewController.swift
//  filmes_populares
//
//  Created by Érika Moriya on 19/02/19.
//  Copyright © 2019 Érika Moriya. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var uiPoster: UIImageView?
    @IBOutlet weak var uiTitle: UILabel?
    @IBOutlet weak var uiRating: UILabel?
    @IBOutlet weak var uiReleaseDate: UILabel?
    @IBOutlet weak var uiDirector: UILabel?
    @IBOutlet weak var uiAuthor: UILabel?
    
    var movie: Movie?
    var posterImage: UIImage?
    var director: Staff?
    var author: Staff?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detalhes"
        uiPoster?.image = posterImage
        uiTitle?.text = movie?.title
        uiRating?.text = movie?.rating
        uiReleaseDate?.text = movie?.releaseDate
        uiDirector?.text = director?.name
        uiAuthor?.text = author?.name
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
