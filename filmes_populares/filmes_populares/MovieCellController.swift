//
//  MovieCellView.swift
//  filmes_populares
//
//  Created by Érika Moriya on 19/02/19.
//  Copyright © 2019 Érika Moriya. All rights reserved.
//

import Foundation
import UIKit

class MovieCellView: UITableViewCell {
    
    @IBOutlet weak var uiView: MovieCellView?
    var movie: Movie?
    
    init() {
        super.init(nibName: "MovieCellView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let movie = self.movie else {
            print("[MovieCellView] Error : Cell don't have movie")
            return
        }
        self.uiView?.uiName?.text = "Nome: " + movie.title
        self.uiView?.uiRating?.text = "   : \(String(describing: movie.rating))"
        self.uiView?.uiDate?.text = movie.releaseDate
        self.uiView?.uiPoster?.image = #imageLiteral(resourceName: "movies")
        
    }
    
}


class MovieCellView: UIView {
    
    @IBOutlet weak var uiName: UILabel?
    @IBOutlet weak var uiRating: UILabel?
    @IBOutlet weak var uiDate: UILabel?
    @IBOutlet weak var uiPoster: UIImageView?
    
}
