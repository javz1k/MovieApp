//
//  CollectionReusableView.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 01.03.24.
//

import UIKit

enum SegmentType: String{
    case TopRated
    case ThisWeek
    case Popular
    case Today
}

class MovieCollectionHeader: UICollectionReusableView {
    var type1:SegmentType = .Today
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet var headerSegment: UISegmentedControl!
    
    @IBAction func seeMoreButton(_ sender: Any) {
        print(#function)
    }
    @IBAction func headerSegmentAction(_ sender: Any) {
        setSegmentType()

    }
    
    var segmentCallBack:((SegmentType) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureView(){
        label.text = "Trending"
        switch type1{
        case .Today :
            headerSegment.setTitle(SegmentType.Today.rawValue, forSegmentAt: 0)
        case .ThisWeek :
            headerSegment.setTitle(SegmentType.ThisWeek.rawValue, forSegmentAt: 1)
        case .Popular :
            headerSegment.setTitle(SegmentType.Popular.rawValue, forSegmentAt: 2)
        case .TopRated :
            headerSegment.setTitle(SegmentType.TopRated.rawValue, forSegmentAt: 3)
        }
    }
    
    func setSegmentType(){
        switch headerSegment.selectedSegmentIndex{
        case 0:
            segmentCallBack?(.Today)
        case 1:
            segmentCallBack?(.ThisWeek)
        case 2:
            segmentCallBack?(.Popular)
        case 3:
            segmentCallBack?(.TopRated)
        default:
            segmentCallBack?(.Today)
        }
    }
    
   
    
}
