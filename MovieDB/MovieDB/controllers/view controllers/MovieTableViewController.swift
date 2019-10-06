//
//  MovieTableViewController.swift
//  MovieDB
//
//  Created by Matthew O'Connor on 10/6/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movies: [MovieQuery] = [] {
           didSet {
               DispatchQueue.main.async {
                   self.tableView.reloadData()
               }
           }
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        let movie = movies[indexPath.row]
        cell.movieItems = movie
        return cell
    }
}

extension MovieTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        MovieController.fetchMovie(with: searchText.lowercased()) { (movie) in
            self.movies = movie
            
            
        }
    }
}
