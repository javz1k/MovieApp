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
    var type1:HeaderType?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet var headerSegment: UISegmentedControl!
    
    @IBAction func seeMoreButton(_ sender: Any) {
        guard let type1 = type1 else {return}
        moreCallBack?(type1)
//        if type1 == .trending {
//            print("Trending")
//        }else{
//            print("Category")
//        }
    
    }
    @IBAction func headerSegmentAction(_ sender: Any) {
        guard let type1 = type1 else {return}
        segmentCallBack?(type1, headerSegment.selectedSegmentIndex)
//        print(type1, headerSegment.selectedSegmentIndex)

    }
    
    var segmentCallBack:((HeaderType, Int) -> Void)?
    var moreCallBack:((HeaderType) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureView(type:HeaderType){
        type1 = type
        label.text = type.rawValue
        headerSegment.setTitle((type == .trending ? "Today" : "Popular"), forSegmentAt: 0)
        headerSegment.setTitle((type == .category ? "This Week" : "Top Rated"), forSegmentAt: 1)
    }
    
   
    
}
