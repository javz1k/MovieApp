//
//  FavoriteViewController.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 28.02.24.
//

import UIKit
import SwipeCellKit

class FavoriteViewController: UIViewController {
    
    
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    var favoriteVM = FavoriteViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoriteVM.getFavoriteListRequest()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteCollectionView.dataSource = self
        favoriteCollectionView.delegate = self
//        favoriteCollectionView.registerNib(with: "MovieCell")
        favoriteCollectionView.registerNib(with: "FavoriteCollectionViewCell")
        configureFavoriteViewModel()
    }
    
     func reloadCollectionView(){
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
        let cell = collectionView.dequeCell(cellClass: FavoriteCollectionViewCell.self, indexPath: indexPath)
        let model = favoriteVM.getMovieList()[indexPath.row]
        cell.configureCell(model: model)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height * 0.15)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = favoriteVM.movieList[indexPath.row]
        if favoriteVM.movieList.indices.contains(indexPath.row) {
            print(#function)
        } else {
            print("Out of range")
        }
        print([indexPath.row])
    }
    
    
}

extension FavoriteViewController: SwipeCollectionViewCellDelegate{
    
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
        
        
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            print("swipe delete")
        }
        
        deleteAction.image = UIImage(named: "delete")
        return [deleteAction]
    }
    
    func collectionView(_ collectionView: UICollectionView, editActionsOptionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }
    
    
}
