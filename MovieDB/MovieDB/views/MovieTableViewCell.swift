//
//  MovieTableViewCell.swift
//  MovieDB
//
//  Created by Matthew O'Connor on 10/6/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var synopsysLabel: UILabel!
    
    var movieItems: MovieQuery? {
        didSet {
            guard let movie = movieItems else {return}
            titleLabel.text = movie.title
            ratingLabel.text = "\(movie.vote)"
            synopsysLabel.text = movie.overview
            movieImageView.image = nil
            
            MovieController.getImage(movie: movie) { (image) in
                if let image = image {
                    DispatchQueue.main.async {
                        self.movieImageView.image = image
                    }
                }
            }
        }
    }
}
