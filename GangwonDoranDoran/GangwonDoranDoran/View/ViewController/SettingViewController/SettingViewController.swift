//
//  SettingViewController.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 6/7/24.
//

import UIKit
import SnapKit
import Then
import Combine

class SettingViewController:UIViewController {
    
    weak var coordinator: SettingCoordinator?
    private var viewModel = SettingViewModel()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let profileImageView = UIImageView().then {
        $0.layer.cornerRadius = 95
        $0.layer.borderWidth = 4
        $0.layer.borderColor = UIColor(red: 226/255.0, green: 226/255.0, blue: 226/255.0, alpha: 1).cgColor
        $0.clipsToBounds = true
        $0.image = UIImage(systemName: "person.fill ")
    }
    
    private let profileNameLabel = UILabel().then {
        $0.text = "프로필 수정"
        $0.font = .systemFont(ofSize: 23)
        $0.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
    }
    
    private let listTableView = UITableView().then {
        $0.backgroundColor = .red
        $0.isScrollEnabled = false
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setUpLayout()
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(SettingCell.self, forCellReuseIdentifier: SettingCell.reuseIdentifier)
        bindViewModel()
    }
    
    func setUpLayout() {
        
        [profileImageView,profileNameLabel,listTableView]
              .forEach { view.addSubview($0)}
        
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(4)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(190)
        }
        
        profileNameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        listTableView.snp.makeConstraints {
            $0.top.equalTo(profileNameLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-90)
        }
        
    }
    
    private func bindViewModel() {
        viewModel.$items
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.listTableView.reloadData()
            }
            .store(in: &cancellables)
        
        viewModel.$sectionHeaders
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.listTableView.reloadData()
            }
            .store(in: &cancellables)
        
        
        
    }
    
    
}


extension SettingViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionHeaders.count
      }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return  viewModel.sectionHeaders[section]
        }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as? SettingCell else {return UITableViewCell() }
        cell.textLabel?.text = viewModel.items[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       
        if indexPath.section == 0 && indexPath.row == 0 {
                  coordinator?.navigateTo(.writePostList)
              } else if indexPath.section == 1 && indexPath.row == 0 {
                  coordinator?.navigateTo(.personalInfo)
              } else if indexPath.section == 1 && indexPath.row == 1 {
                  coordinator?.navigateTo(.notice)
              } else if indexPath.section == 1 && indexPath.row == 2 {
                  coordinator?.navigateTo(.appInfo)
              }
       
        
        
    }
    
}
