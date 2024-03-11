//
//  Extensions.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 01.03.24.
//

import Foundation
import UIKit
import SDWebImage
extension UICollectionView {
func registerNib(with identifier: String)
{
 self.register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
}
func registerCodedCell(with cellClass: AnyClass)
{
 let identifier = String(describing: cellClass.self)
 self.register(cellClass, forCellWithReuseIdentifier: identifier)
}
func dequeCell<T>(cellClass : T.Type, indexPath: IndexPath) -> T where T: UICollectionViewCell
{
 let identifier = String(describing: T.self)
 return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
}
}
extension UIImageView {
    func loadURL(_ url: String) {
        let urlString = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        if let url = URL(string: urlString) {
            print(url)
            sd_setImage(with: url)
        }
    }
    
}
