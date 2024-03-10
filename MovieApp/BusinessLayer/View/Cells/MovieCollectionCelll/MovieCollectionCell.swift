//
//  MovieCollectionCell.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 29.02.24.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var movieCollectionView:UICollectionView!
    private var list: [MovieCellProtocol]?
    
    func setList(list: [MovieCellProtocol]) {
        self.list = list
        movieCollectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieCollectionView.registerNib(with: "MovieCell")
    }

}

extension MovieCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellClass: MovieCell.self, indexPath: indexPath)
        guard let model = list?[indexPath.row] else {return UICollectionViewCell()}
        cell.configureCell(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.height)
    }
}
