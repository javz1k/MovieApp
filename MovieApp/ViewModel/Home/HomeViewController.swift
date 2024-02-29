//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 28.02.24.
//

import UIKit

class HomeViewController: UIViewController {
   
    
    
    private var homeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.getPopularMovieList()
        configureHomeViewModel()
    }
    
    fileprivate func configureHomeViewModel(){
        homeViewModel.successCallBack = { [weak self] in
            guard let self = self else {return}
            print("success")
        }
        
        homeViewModel.errorCallBack = { [weak self] error in
            guard let self = self else {return}
            print("errorr")
        }
    }

}
