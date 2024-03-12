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
        configureHomeViewModel()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(with: "MovieCell")
        
        collectionView.register(UINib(nibName: "MovieCollectionHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"MovieCollectionHeader")
        }
    
    
    
    fileprivate func configureHomeViewModel(){
        
        homeViewModel.successCallBack = { [weak self] in
            guard let self = self else {return}
            self.reloadCollectionView()
            print("success")
        }
        
        homeViewModel.errorCallBack = { [weak self] error in
            guard self != nil else {return}
            print("error")
        }
    }
    
    fileprivate func reloadCollectionView(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    
    fileprivate func segmentAction(type: SegmentType){
        homeViewModel.getMovieForType(type: type)
        print(type)
    }

}

extension HomeViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.getMovieCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellClass: MovieCell.self, indexPath: indexPath)
        let model = homeViewModel.getMovieList()[indexPath.row]
        cell.configureCell(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height * 0.28)

    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            
        case UICollectionView.elementKindSectionHeader :
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MovieCollectionHeader", for: indexPath) as! MovieCollectionHeader
            header.configureView()
            header.segmentCallBack = { [weak self] SegmentType in
                guard let self = self else {return}
                self.segmentAction(type: SegmentType)
            }
            return header
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    
}
