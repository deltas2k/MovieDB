//
//  Movies.swift
//  MovieDB
//
//  Created by Matthew O'Connor on 10/6/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import Foundation

struct TopLevelDictionary: Decodable {
    let results: [MovieQuery]
}

struct MovieQuery: Decodable {
    enum CodingKeys: String, CodingKey {
        case title
        case vote = "vote_average"
        case overview
        case image = "poster_path"
    }
    
    let title: String
    let vote: Double
    let overview: String
    let image: String?
}
