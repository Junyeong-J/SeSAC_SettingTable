//
//  SettingTableViewController.swift
//  SettingProject
//
//  Created by 전준영 on 5/23/24.
//

import UIKit

enum ViewType: Int, CaseIterable {
    
    case all, set, etc
    
    var mainTitle: String {
        switch self {
        case .all:
            return "전체 설정"
        case .set:
            return "개인 설정"
        case .etc:
            return "기타"
        }
    }
    
    
    var subTitle: [String] {
        switch self{
        case .all:
            return ["공지사항", "실험실", "버전정보"]
        case .set:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .etc:
            return ["고객센터/도움말"]
        }
        
    }
}

class SettingTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ViewType.allCases[section].mainTitle
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return ViewType.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewType.allCases[section].subTitle.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "junCell")!
        cell.textLabel?.text = ViewType.allCases[indexPath.section].subTitle[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 13)
        return cell
    }
    
    
    
}

