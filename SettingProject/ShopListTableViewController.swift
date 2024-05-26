//
//  ShopListTableViewController.swift
//  SettingProject
//
//  Created by 전준영 on 5/24/24.
//

import UIKit

struct Shop {
    var doing: Bool
    let shopEx: String
    var store: Bool
}

class ShopListTableViewController: UITableViewController {

    var list = [
        Shop(doing: true, shopEx: "그립톡 구매하기", store: true),
        Shop(doing: false, shopEx: "사이다 구매", store: false),
        Shop(doing: false, shopEx: "아이패드 케이스 최저가 알아보기", store: true),
        Shop(doing: false, shopEx: "양말", store: true)
    ]
    
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var addUIView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addUIView.layer.cornerRadius = 5
        
        addTextField.tintColor = .black
        addTextField.placeholder = "무엇을 구매하실 건가요?"
        addTextField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        addTextField.leftViewMode = .always
        
        
        
        addButton.layer.cornerRadius = 10
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
        
    }
    
    @objc func addButtonClicked() {
        
        guard let text = addTextField.text, text.count > 1 else {return}
        
        list.append(Shop(doing: false, shopEx: text, store: false))
        addTextField.text = ""
        
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShopListTableViewCell", for: indexPath) as! ShopListTableViewCell
        let data = list[indexPath.row]
        
        let name = data.doing ? "checkmark.square.fill" : "checkmark.square"
        let image = UIImage(systemName: name)
        cell.checkButton.setImage(image, for: .normal)
        cell.checkButton.tintColor = .black
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        
        cell.shopTitleLabel.text = data.shopEx
        cell.shopTitleLabel.font = .systemFont(ofSize: 15)
        
        let storeName = data.store ? "star.fill" : "star"
        let storeImage = UIImage(systemName: storeName)
        cell.storeButton.setImage(storeImage, for: .normal)
        cell.storeButton.tintColor = .black
        cell.storeButton.tag = indexPath.row
        cell.storeButton.addTarget(self, action: #selector(storeButtonClicked), for: .touchUpInside)
        
        cell.tableUIView.layer.cornerRadius = 5
        
        return cell
    }

    @objc func checkButtonClicked(sender: UIButton) {
        
        list[sender.tag].doing.toggle()
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
    }
    
    @objc func storeButtonClicked(sender: UIButton) {
        
        list[sender.tag].store.toggle()
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
    }
    
}
