//
//  DetailViewController.swift
//  Flix
//
//  Created by Gina Ratto on 11/17/17.
//  Copyright © 2017 Gina Ratto. All rights reserved.
//

import UIKit

enum MovieKeys {
    static let title = "title"
    static let overview = "overview"
    static let releaseDate = "release_date"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
}

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var backDropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    
    let BASE_URL = "https://image.tmdb.org/t/p/w500"

    var movie: [String: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie {
            titleLabel.text = movie[MovieKeys.title] as? String
            overviewLabel.text = movie[MovieKeys.overview] as? String
            releaseDateLabel.text = movie[MovieKeys.releaseDate] as? String
            
            let backdropPathString = movie[MovieKeys.backdropPath] as! String
            let posterPathString = movie[MovieKeys.posterPath] as! String
            
            let backdropURL = URL(string: BASE_URL + backdropPathString)!
            backDropImageView.af_setImage(withURL: backdropURL)
            let posterPathURL = URL(string: BASE_URL + posterPathString)!
            posterImageView.af_setImage(withURL: posterPathURL)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
