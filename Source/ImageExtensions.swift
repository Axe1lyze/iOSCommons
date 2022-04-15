//
//  ImageExtensions.swift
//  iOSUtils
//
//  Created by Masaharu Tsukamoto on 2022/04/15.
//

import Foundation
import UIKit

extension UIImage {
    
    public func resize(size _size: CGSize) -> UIImage? {
        
        let widthRatio = _size.width / size.width
        let heightRatio = _size.height / size.height
        let ratio = widthRatio < heightRatio ? widthRatio : heightRatio
        
        let resizedSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        
        UIGraphicsBeginImageContextWithOptions(resizedSize, false, 0.0) // 変更
        draw(in: CGRect(origin: .zero, size: resizedSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
}
