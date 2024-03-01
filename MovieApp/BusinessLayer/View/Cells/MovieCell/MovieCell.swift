//
//  MovieCell.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 01.03.24.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var image:UIImageView!
    @IBOutlet weak var title:UILabel!
    @IBOutlet weak var subtitle:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
        // Initialization code
    }
    
    func setUpView(){
        image.layer.cornerRadius = 8
    }
   
    func configureCell(){
        title.text = "Title"
        subtitle.text = "Subtitle"
    }

}
