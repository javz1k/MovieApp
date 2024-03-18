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
    @IBOutlet weak var xmarkButton:UIButton!
    
    private var homeViewModel = HomeViewModel()
    fileprivate var searchBarIsHidden: Bool = true
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

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
                          duration: 0.5,
                          options: .transitionFlipFromBottom) {
            self.sortButton.isHidden = !self.searchBarIsHidden
            self.searchTextField.isHidden = self.searchBarIsHidden
            self.xmarkButton.isHidden = self.searchBarIsHidden
            self.searchButton.isHidden = !self.searchBarIsHidden
        }
        
        
    }
    
    @IBAction func sortButtonAction(_ sender: Any) {
        print(#function)
        
    }
    
    @IBAction func xmarkButtonAction(_ sender: Any) {
        print(#function)
        UIView.transition(with: searchTextField,
                          duration: 0.5,
                          options: .transitionFlipFromBottom) {
            self.sortButton.isHidden = false
            self.searchTextField.isHidden = true
            self.xmarkButton.isHidden = true
            self.searchButton.isHidden = false
        }
    }
    
    fileprivate func configureHomeViewModel(){
        
        homeViewModel.successCallBack = { [weak self] in
            guard let self = self else {return}
            self.reloadCollectionView()
        }
        
        homeViewModel.errorCallBack = { [weak self] error in
            guard self != nil else {return}
        }
    }
    
    fileprivate func reloadCollectionView(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    fileprivate func segmentAction(type: SegmentType){
        homeViewModel.getMovieForType(type: type)
        //hiding search bar
        UIView.transition(with: searchTextField,
                          duration: 0.8,
                          options: .transitionFlipFromBottom) {
            self.sortButton.isHidden = false
            self.searchTextField.isHidden = true
            self.xmarkButton.isHidden = true
            self.searchButton.isHidden = false
        }
        print("segmentaction",type)
    }

    fileprivate func showDetailController(model: MovieCellProtocol) {
        let controller = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SelectedMovieViewController") as! CardDetailController
        controller.movie = model
        navigationController?.pushViewController(controller, animated: true)
                
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = homeViewModel.movieList[indexPath.row]
        if homeViewModel.movieList.indices.contains(indexPath.row) {
            showDetailController(model: movie)
        } else {
            print("Out of range")
        }
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
        SearchManager.shared.cancelRequest()
        homeViewModel.getSearchMovieListRequest(text: text)
    }
}
