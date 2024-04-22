//
//  FavoriteCollectionViewCell.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 18.04.24.
//

import UIKit
import SwipeCellKit

class FavoriteCollectionViewCell: SwipeCollectionViewCell {
    
    @IBOutlet weak var image:UIImageView!
    @IBOutlet weak var title:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    func setUpView(){
        image.layer.cornerRadius = 8
    }
   
    func configureCell(model: MovieCellProtocol){
        title.text = model.titleString
        image.loadURL(model.iconString)

    }

}



