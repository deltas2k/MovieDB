//
//  MovieContraint.swift
//  MovieDB
//
//  Created by Matthew O'Connor on 10/6/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

/// api_key=4a40c8425d1279ead340f563465c0a7c
/// https://api.themoviedb.org/3/search/movie?api_key=4a40c8425d1279ead340f563465c0a7c&query=
/// poster: http://image.tmdb.org/t/p/w500/(imageEndpoint)

import Foundation

struct MoviesConstants {
    static let baseURL = "https://api.themoviedb.org/3/search/"
    static let urlComponent1 = "movie"
    static let urlQuery1key = "api_key"
    static let apiKey = "4a40c8425d1279ead340f563465c0a7c"
    static let urlQuery2key = "query"
    static let posterURL = "http://image.tmdb.org/t/p/w500"
}
