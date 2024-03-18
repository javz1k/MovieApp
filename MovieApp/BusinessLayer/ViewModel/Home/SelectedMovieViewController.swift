//
//  SelectedMovieViewController.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 18.03.24.
//

import UIKit

class SelectedMovieViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var aboutTextView: UITextView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func configureView(data:MovieCellProtocol?){
        guard let data = data else {return}
        print("CONFIGURE //////////////",data)
        movieNameLabel.text = data.titleString
        posterImageView.loadURL(data.iconString)
        aboutTextView.text = data.aboutString
        
        let dateString = data.subTitleString
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
