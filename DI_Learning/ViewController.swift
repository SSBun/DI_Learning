//
//  ViewController.swift
//  DI_Learning
//
//  Created by caishilin on 2022/11/1.
//

import UIKit
import Resolver
import SnapKit

class ViewController: UIViewController {
    private let listView = UITableView(frame: .zero, style: .plain)
    private let dis: [UIViewController.Type] = [
        ResolverDI.self
    ]
    private var listData: [(String, UIViewController.Type)] {
        dis.map({ (NSStringFromClass($0) ,$0)})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(listView)
        listView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        listView.delegate = self
        listView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = listData[indexPath.row].0
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcType = listData[indexPath.row].1
        present(vcType.init(), animated: true)
    }
}

