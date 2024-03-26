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
    var aboutString:String {get}
    var movieID:Int {get}
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
        image.loadURL(model.iconString)
        
        let dateString = model.subTitleString
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"

        if let date = inputFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd-MM-yyyy"
            
            let formattedDate = outputFormatter.string(from: date)
            subtitle.text = formattedDate
            print(formattedDate)
        } else {
            print("Invalid date format")
        }

    }

}
