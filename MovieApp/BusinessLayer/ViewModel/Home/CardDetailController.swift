//
//  SelectedMovieViewController.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 18.03.24.
//

import UIKit
class CardDetailController: UIViewController {
    var movie: MovieCellProtocol?
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var aboutTextView: UITextView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var newbtn:UIButton!
    
    @IBAction func newBtnAction(_ sender: Any) {
        print("buttonTapped")
        let vc = UIStoryboard.init(name:"Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        vc.movie = movie
        navigationController?.pushViewController(vc, animated: true)
    }
    lazy var trailerButton:UIButton = {
        let trailerButton = UIButton(type: .custom)
        trailerButton.setTitle("Play trailer", for: .normal)
        trailerButton.layer.borderWidth = 1
        trailerButton.layer.borderColor = UIColor.white.cgColor
        trailerButton.layer.cornerRadius = 5
        trailerButton.setTitleColor(.white, for: .normal)
        trailerButton.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        trailerButton.addTarget(self, action: #selector(trailerButtonTapped), for: .touchUpInside)
        trailerButton.frame = CGRect(x: 30, y: 350, width: 200, height: 46)
        return trailerButton
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        posterImageView.addSubview(trailerButton)
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
    
    @objc func trailerButtonTapped(){
        print("buttonTapped")
        let vc = UIStoryboard.init(name:"Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        vc.movie = movie
        navigationController?.pushViewController(vc, animated: true)
    }
   

}
