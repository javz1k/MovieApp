//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 28.02.24.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var indicator:UIActivityIndicatorView!
    @IBOutlet weak var searchButton:UIButton!
    @IBOutlet weak var sortButton:UIButton!
    @IBOutlet weak var searchTextField:UITextField!
    
    private var homeViewModel = HomeViewModel()
    fileprivate var searchBarIsHidden: Bool = true
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeViewModel()
        collectionView.delegate = self
        collectionView.dataSource = self
        searchTextField.delegate = self
        collectionView.registerNib(with: "MovieCell")
        
        collectionView.register(UINib(nibName: "MovieCollectionHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:"MovieCollectionHeader")
        }
    
    private var showLoading: Bool = false {
        didSet {
            DispatchQueue.main.async{
                self.showLoading ? self.indicator.startAnimating() : self.indicator.stopAnimating()
            }
        }
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        print(#function)
        searchBarIsHidden = !searchBarIsHidden
        UIView.transition(with: searchTextField,
                          duration: 0.8,
                          options: .transitionFlipFromBottom) {
            self.sortButton.isHidden = !self.searchBarIsHidden
            self.searchTextField.isHidden = self.searchBarIsHidden
        }
    }
    
    @IBAction func sortButtonAction(_ sender: Any) {
        print(#function)
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
        return CGSize(width: collectionView.frame.width/3.2 , height: collectionView.frame.height * 0.25)
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

extension HomeViewController:UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {return}
        homeViewModel.searchMovieNameCallBack?(text)
        homeViewModel.getSearchMovieList()
        print(#function, text)
    }
    
}


