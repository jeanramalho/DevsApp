//
//  UIViewController+Extensions.swift
//  DevsApp
//
//  Created by Jean Ramalho on 22/10/25.
//
import Foundation
import UIKit

extension UIViewController {

    
    public func setNavigationTabBarToHidden(isHidden: Bool){
        
        self.navigationController?.navigationBar.isHidden = isHidden
    }
    
    public func setupNavigationBarAppearance(){
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Colors.bgColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.compactAppearance = appearance
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
    }
    
    public func updateNavTitleAlpha(for contentOffSet: CGPoint, tableView: UITableView, fadeStart: CGFloat, fadeEnd: CGFloat, titleLabel: UILabel){
        
        let offSetReal = contentOffSet.y + tableView.adjustedContentInset.top
        
        let progress: CGFloat
        if offSetReal <= fadeStart {
            progress = 0
        } else {
            progress = (offSetReal - fadeStart) / (fadeEnd - fadeStart)
        }
        
        titleLabel.alpha = progress
        
        navigationItem.titleView?.isHidden = progress == 0
    }
    
}
