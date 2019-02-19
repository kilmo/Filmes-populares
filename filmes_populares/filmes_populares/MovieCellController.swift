//
//  MovieCellController.swift
//  filmes_populares
//
//  Created by Érika Moriya on 19/02/19.
//  Copyright © 2019 Érika Moriya. All rights reserved.
//

import Foundation
import UIKit

class MovieCellController: UITableViewCell {
    
    @IBOutlet weak var uiView: MovieCellView?
    var movie: Movie?
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let movie = self.movie else {
            print("[MovieCellController] Error : Cell don't have movie")
            return
        }
        self.uiView?.uiName?.text = "Nome: " + movie.name
        self.uiView?.uiRating?.text = "   : \(String(describing: movie.rating))"
        self.uiView?.uiDate?.text = ""
//        self.uiView?.uiPoster =
        
    }
    
}


class MovieCellView: UIView {
    
    @IBOutlet weak var uiName: UILabel?
    @IBOutlet weak var uiRating: UILabel?
    @IBOutlet weak var uiDate: UILabel?
    @IBOutlet weak var uiPoster: UIImageView?
    
}
