//
//  CardDetailController.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 18.03.24.
//

import UIKit
class CardDetailController: UIViewController {
    var movie: MovieCellProtocol?
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var movieNameLabel: UILabel!
//    @IBOutlet weak var newbtn:UIButton!
//    @IBOutlet weak var favoriteButtonTest: UIButton!
    
    var movieID:Int = 0
    
//    @IBAction func favoriteButtonAction(_ sender: Any) {
//        print(#function)
//    }
//    @IBAction func newBtnAction(_ sender: Any) {
//        print("buttonTapped")
//        let vc = UIStoryboard.init(name:"Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
//        vc.movie = movie
//        navigationController?.pushViewController(vc, animated: true)
//    }
    
    private lazy var trailerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Play trailer", for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.cornerRadius = 8
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .color35CEE3
        btn.addTarget(self, action: #selector(trailerButtonTapped), for: .touchUpInside)
        btn.anchorSize(.init(width: 0, height: 48))
        return btn
    }()
    
    private lazy var favoriteButton:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "heart"), for: .normal)
        btn.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        btn.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        btn.anchorSize(.init(width: 48, height: 48))
        return btn
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    fileprivate func configureView(){
        guard let movie = movie else {return}
        print("CONFIGURE //////////////",movie)
        movieID = movie.movieID
        movieNameLabel.text = movie.titleString
        posterImageView.loadURL(movie.iconString)
        aboutLabel.text = movie.aboutString
        
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
    
    fileprivate func setupView() {
        bgView.addSubview(trailerButton)
        bgView.addSubview(favoriteButton)
        trailerButton.anchor(
            leading: bgView.leadingAnchor,
            bottom: bgView.bottomAnchor,
            trailing: bgView.trailingAnchor,
            padding: .init(top: 0, left: 24, bottom: -24, right: -24))
        
        favoriteButton.anchor(
            top: bgView.topAnchor,
            trailing: bgView.trailingAnchor,
            padding: .init(top: 48, left: 0, bottom: 0, right: -24))
        configureView()
    }
    
    @objc func trailerButtonTapped(_ sender: UIButton){
        print("trailerButtonTapped")
        let vc = UIStoryboard.init(name:"Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        vc.movie = movie
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func favoriteButtonTapped(_ sender: UIButton){
        print("favoriteButtonTapped")
    }
   

}
