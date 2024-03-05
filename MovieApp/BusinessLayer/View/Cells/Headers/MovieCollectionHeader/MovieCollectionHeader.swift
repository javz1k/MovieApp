//
//  CollectionReusableView.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 01.03.24.
//

import UIKit

enum HeaderType: String {
    case trending = "Trending"
    case category = "Category"
}

class MovieCollectionHeader: UICollectionReusableView {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet var headerSegment: UISegmentedControl!
    
    @IBAction func seeMoreButton(_ sender: Any) {
//        type == .trending ? print("trendingAction") : print("categoryAction")
    
    }
    @IBAction func headerSegmentAction(_ sender: Any) {
        print(headerSegment.selectedSegmentIndex)
    }
    
    var segmentCallBack:(() -> Void)?
    var moreCallBack:((HeaderType) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureView(type:HeaderType){
        label.text = type.rawValue
        headerSegment.setTitle((type == .trending ? "Today" : "Popular"), forSegmentAt: 0)
        headerSegment.setTitle((type == .category ? "This Week" : "Top Rated"), forSegmentAt: 1)
    }
    
   
    
}
