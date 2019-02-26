//
//  Extensions.swift
//  filmes_populares
//
//  Created by Érika Moriya on 24/02/19.
//  Copyright © 2019 Érika Moriya. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    public func downloadImage(from urlString: String) {
        self.image = nil
        
        guard let url = URL(string: urlString) else {
            print("[Extensions] Couldn't create url")
            self.image = #imageLiteral(resourceName: "movies")
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (rawData, response, error) -> Void in
            
            if error != nil {
                print("[Extensions] Download error: \(String(describing: error))")
                self.image = #imageLiteral(resourceName: "movies")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                if let data = rawData, let image = UIImage(data: data) {
                    self.image = image
                } else {
                    self.image = #imageLiteral(resourceName: "movies")
                }
            })
        }).resume()
    }
}

