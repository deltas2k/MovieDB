//
//  MovieController.swift
//  MovieDB
//
//  Created by Matthew O'Connor on 10/6/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import UIKit

class MovieController {
    static let baseURL = URL(string: MoviesConstants.baseURL)
    static let posterURL = URL(string: MoviesConstants.posterURL)
    
    static func fetchMovie(with searchText: String, completion: @escaping ([MovieQuery]) -> Void) {
        let appendURL = baseURL?.appendingPathComponent(MoviesConstants.urlComponent1)
        guard let url = appendURL else {completion([]); return}
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryAPI = URLQueryItem(name: MoviesConstants.urlQuery1key, value: MoviesConstants.apiKey)
        let queryMovie = URLQueryItem(name: MoviesConstants.urlQuery2key, value: searchText)
        urlComponents?.queryItems = [queryAPI,queryMovie]
        guard let finalURL = urlComponents?.url else {completion ([]); return}
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion([]); return
            }
            guard let data = data else {completion([]); return}
            do {
                let decode = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                completion(decode.results)
            } catch {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
        .resume()
    }
    
    static func getImage(movie: MovieQuery, completion: @escaping (UIImage?) -> Void) {
        let appendURL = posterURL?.appendingPathComponent(String(movie.image ?? ""))
        guard let finalURL = appendURL else {completion(nil);return}
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
           if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                completion(nil);return
            }
            guard let data = data else {
                    print("error getting image");completion(nil); return
                }
                let image = UIImage(data: data)
                completion(image)
        }
    .resume()
    }
}
