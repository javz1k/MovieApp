//
//  FavoriteViewController.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 28.02.24.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    var favoriteVM = FavoriteViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteCollectionView.dataSource = self
        favoriteCollectionView.delegate = self
        favoriteCollectionView.registerNib(with: "MovieCell")
        configureFavoriteViewModel()
        favoriteVM.getFavoriteListRequest()
    }
    
    fileprivate func reloadCollectionView(){
        DispatchQueue.main.async {
            self.favoriteCollectionView.reloadData()
        }
    }
    
    fileprivate func configureFavoriteViewModel(){
        
        favoriteVM.successCallBack = { [weak self] in
            guard let self = self else {return}
            self.reloadCollectionView()
        }
        
        favoriteVM.errorCallBack = { [weak self] error in
            guard let self = self else {return}
            print(self)
        }
        
//        favoriteVM.showLoading = { [weak self] isShow in
//            guard let self = self else {return}
//            self.showLoading = isShow
//        }
    }

    

}



extension FavoriteViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteVM.getMovieCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellClass: MovieCell.self, indexPath: indexPath)
        let model = favoriteVM.getMovieList()[indexPath.row]
        cell.configureCell(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3.2 , height: collectionView.frame.height * 0.25)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let movie = favoriteVM.movieList[indexPath.row]
//        if favoriteVM.movieList.indices.contains(indexPath.row) {
//            showDetailController(model: movie)
//        } else {
//            print("Out of range")
//        }
        print([indexPath.row])
    }
}
