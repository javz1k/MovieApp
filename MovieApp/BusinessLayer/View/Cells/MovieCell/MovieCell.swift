//
//  MovieCell.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 01.03.24.
//

import UIKit

protocol MovieCellProtocol{
    var titleString:String {get}
    var subTitleString:String {get}
    var iconString:String {get}
}

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
   
    func configureCell(model: MovieCellProtocol){
        title.text = model.titleString
        subtitle.text = model.subTitleString
        image.loadURL(model.iconString)
    }

}
