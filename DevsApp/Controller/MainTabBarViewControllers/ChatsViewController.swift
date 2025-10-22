//
//  ChatsViewController.swift
//  DevsApp
//
//  Created by Jean Ramalho on 19/10/25.
//
import Foundation
import UIKit

class ChatsViewController: UIViewController {
    
    private let contentView: ChatsView = ChatsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        
        setHierarchy()
        setConstraints()
        setupContentView()
    }
    
    private func setupContentView(){
        
        contentView.chatsTableView.dataSource = self
        contentView.chatsTableView.delegate = self
    }
    
    private func setHierarchy(){
        
        view.addSubview(contentView)
    }
    
    private func setConstraints(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.setConstraintsToParent(self.view)
        
        
    }
}

extension ChatsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Testando tableView"
        return cell
    }
    
    
}
