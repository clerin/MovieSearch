//
//  MovieSearchViewController.swift
//  MoovySearch
//
//  Created by Clerin on 1/28/21.
//

import UIKit

class MovieSearchViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{
    
    let movieViewModel = MovieSearchViewModel()
    @IBOutlet weak var movieSearchBar: UISearchBar!
    @IBOutlet weak var movieTableview: UITableView!
    var enteredName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieSearchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        enteredName = searchBar.text
        if enteredName == nil {
            enteredName = "Enter movie name"
        } else {
            movieViewModel.getMovieFromWebService(searchTerm: enteredName! + getURL.secondURL.rawValue) { (success) in
                DispatchQueue.main.async { [weak self] in
                    if !success {
                        let alert = UIAlertController(title: "Sorry!", message: "Movie not found", preferredStyle: .alert)
                        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                        alert.addAction(action)
                        self?.present(alert, animated: true, completion: nil)
                    } else {
                        self?.movieTableview.reloadData()
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieViewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableview.dequeueReusableCell(withIdentifier: "cell") as! MovieSearchTableViewCell
        cell.movieLabel.text = movieViewModel.getMovietitle(index: indexPath.row)
        cell.movieImageView.load(url: movieViewModel.getMovieImage(index: indexPath.row))
        cell.starImageView.image = UIImage(named: movieViewModel.getImdbRatingImageName(index: indexPath.row))
        return cell
    }
}
