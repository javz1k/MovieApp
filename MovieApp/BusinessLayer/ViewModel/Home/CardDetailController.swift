//
//  SelectedMovieViewController.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 18.03.24.
//

import UIKit
class CardDetailController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var aboutTextView: UITextView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    var movie: MovieCellProtocol?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView(){
        guard let movie = movie else {return}
        print("CONFIGURE //////////////",movie)
        movieNameLabel.text = movie.titleString
        posterImageView.loadURL(movie.iconString)
        aboutTextView.text = movie.aboutString
        
        let dateString = movie.subTitleString
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"

        if let date = inputFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd-MM-yyyy"
            
            let formattedDate = outputFormatter.string(from: date)
            releaseDateLabel.text = formattedDate
        } else {
            print("Invalid date format")
        }
    }
    

   

}
