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
        setupUIController()
        setupTabBarConroller()
    }
    
    private func setupTabBarConroller(){
        self.view.backgroundColor = Colors.bgColor
    }
    
    private func setupViewController(){
        
        let chatsViewController = ChatsViewController()
        let settingsViewController = SettingsViewController()
        let contactsViewController = ContactsViewController()
        
        let navChats = UINavigationController(rootViewController: chatsViewController)
        let navSettings = UINavigationController(rootViewController: settingsViewController)
        let navContacts = UINavigationController(rootViewController: contactsViewController)
        
        navChats.tabBarItem = UITabBarItem(title: "Chats",
                                           image: UIImage(systemName: "bubble.left.and.bubble.right"),
                                           selectedImage: UIImage(systemName: "bubble.left.and.bubble.right.fill"))
        
        navSettings.tabBarItem = UITabBarItem(title: "Configs",
                                              image: UIImage(systemName: "gear"),
                                              selectedImage: UIImage(systemName: "gear.fill"))
        
        navContacts.tabBarItem = UITabBarItem(title: "Contatos",
                                              image: UIImage(systemName:"person.crop.circle"),
                                              selectedImage: UIImage(systemName:"person.crop.circle.fill"))
        
        
        viewControllers = [navChats, navContacts, navSettings]
        
        selectedIndex = 0
    }
    
    private func setupUIController(){
        
        let appearence = UITabBarAppearance()
        appearence.configureWithOpaqueBackground()
        appearence.backgroundColor = Colors.bgColor
        appearence.stackedLayoutAppearance.selected.iconColor = Colors.bluePrimary
        appearence.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: Colors.bluePrimary]
        
        tabBar.standardAppearance = appearence
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearence
        }
        
        tabBar.isTranslucent = true
        tabBar.tintColor = Colors.bluePrimary
    }
}
