//
//  SettingTableViewController.swift
//  SettingProject
//
//  Created by 전준영 on 5/23/24.
//

import UIKit

class SettingTableViewController: UITableViewController {

    let header = ["전체설정", "개인설정", "기타"]
    let list = [["공지사항", "실험실", "버전정보"], ["개인/보안", "알림", "채팅", "멀티프로필"], ["고객센터/도움말"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return header[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].count
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "junCell")!
        cell.textLabel?.text = list[indexPath.section][indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 13)
        return cell
    }
    
    
    
}