//
//  MoviesListViewController.swift
//  filmes_populares
//
//  Created by Érika Moriya on 19/02/19.
//  Copyright © 2019 Érika Moriya. All rights reserved.
//

import UIKit

class MoviesListViewController: ListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        uiTableView?.delegate = self
        uiTableView?.dataSource = self
//        self.title = "Filmes"
        addNavigationItem()
        loadList(page: 1)
    }

    func addNavigationItem(){
        let refreshButton = UIBarButtonItem(image: UIImage(named:"refresh"), style: .plain, target: self, action: #selector(refreshList))
        refreshButton.tintColor = .black
        self.navigationItem.title = "Filmes"
        self.navigationItem.rightBarButtonItem = refreshButton
    }
    
    @objc func refreshList(){
        loadList(page: 1)
        self.uiTableView?.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
    
    func loadList(page: Int){
        MoviesCapsule.shared.downloadMovies(page: page){
            self.dataSource = MoviesCapsule.shared.allMovies
            self.uiTableView?.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newViewController = MovieDetailsViewController(nibName: "MovieDetailsViewController", bundle: nil)
        MoviesCapsule.shared.downloadCredits(){
            
            if let credits = MoviesCapsule.shared.credits?.crew {
                for staff in credits {
                    if staff.job == "Director" {
                        newViewController.director = staff
                    } else if staff.department == "Writing" && staff.job != "Screenplay" {
                        newViewController.author = staff
                    }
                }
            }
            newViewController.posterImage = (tableView.cellForRow(at: indexPath) as? MovieTableViewCell)?.uiPoster?.image
            newViewController.movie = self.dataSource?[indexPath.row]
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
