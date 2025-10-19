//
//  M.swift
//  DevsApp
//
//  Created by Jean Ramalho on 19/10/25.
//
import UIKit
import Foundation

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    private func setupViewController(){
        
        let chatsViewController = ChatsViewController()
        let settingsViewController = SettingsViewController()
        
        let navChats = UINavigationController(rootViewController: chatsViewController)
        let navSettings = UINavigationController(rootViewController: settingsViewController)
        
        navChats.tabBarItem = UITabBarItem(title: "Chats",
                                           image: UIImage(systemName: "bubble.left.and.bubble.right"),
                                           selectedImage: UIImage(systemName: "bubble.left.and.bubble.right.fill"))
        
        navSettings.tabBarItem = UITabBarItem(title: "Configs",
                                              image: UIImage(systemName: "gear"),
                                              selectedImage: UIImage(systemName: "gear.fill"))
        
        viewControllers = [navChats, navSettings]
        
        selectedIndex = 0
    }
}
