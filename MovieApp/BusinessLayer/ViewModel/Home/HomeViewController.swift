//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 28.02.24.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var collectionView:UICollectionView!
    
    
    private var homeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.getPopularMovieList()
        configureHomeViewModel()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(with: "MovieCollectionCell")
        
        collectionView.register(UINib(nibName: "MovieCollectionHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"MovieCollectionHeader")
        
//        collectionView.register(UINib(nibName: "MovieCollectionCell", bundle: nil), forCellWithReuseIdentifier: "MovieCollectionCell")
    }
    
    
    
    fileprivate func configureHomeViewModel(){
        
        homeViewModel.successCallBack = { [weak self] in
            guard let self = self else {return}
            print("success")
        }
        
        homeViewModel.errorCallBack = { [weak self] error in
            guard let self = self else {return}
            print("error")
        }
    }

}

extension HomeViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionCell", for: indexPath) as! MovieCollectionCell
        let cell = collectionView.dequeCell(cellClass: MovieCollectionCell.self, indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 84)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height * 0.28)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            
        case UICollectionView.elementKindSectionHeader :
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MovieCollectionHeader", for: indexPath)
            return header
            
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    
}
