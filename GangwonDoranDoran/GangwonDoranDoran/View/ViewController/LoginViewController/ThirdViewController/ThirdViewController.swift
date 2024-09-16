//
//  ThirdViewController.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 6/7/24.
//

import UIKit
import Combine
import SnapKit
import Then

class ThirdViewController:UIViewController {
    
    private let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "인기장소", at: 0, animated: true)
        segment.insertSegment(withTitle: "인기숙소", at: 1, animated: true)
        //    segment.insertSegment(withTitle: "최근리뷰", at: 2, animated: true)
        segment.selectedSegmentIndex = 0   // 첫번째 segmented control의 인덱스 값
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.blue,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .semibold)
        ], for: .normal)
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .semibold)
        ], for: .selected)
        segment.selectedSegmentTintColor = .clear
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        return segment
    }()
    
    private let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private let popularPlacesView = UITableView()
    private let popularAccommodationsView = UITableView()
    
    weak var coordinator: Coordinator?
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSearchButton()
        setupSegmentControl()
        setupViews()
    }
    
    
    private func setupSearchButton() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "검색어를 입력하세요"
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = self
        
        if let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textField.attributedPlaceholder = NSAttributedString(
                string: "검색어를 입력하세요",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white] // 원하는 색상으로 변경
            )
            textField.leftView?.tintColor = .white
        }
    }
    
    func setupSegmentControl() {
        view.addSubview(segmentControl)
        view.addSubview(underLineView)
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(50)
        }
        
        underLineView.snp.makeConstraints {
            $0.top.equalTo(segmentControl.snp.bottom).offset(8)
            $0.width.equalTo((UIScreen.main.bounds.width - 16) / 2)
            $0.height.equalTo(2)
            $0.leading.equalTo(segmentControl.snp.leading)
        }
        
        segmentControl.addTarget(self, action: #selector(changeSegmentedControlLinePosition(_:)), for: .valueChanged)
        segmentControl.addTarget(self, action: #selector(didChangeValue(_:)), for: .valueChanged)
        
        
    }
    
    private func setupViews() {
        // 테이블 뷰 추가 및 기본 설정
        view.addSubview(popularPlacesView)
        view.addSubview(popularAccommodationsView)
        popularPlacesView.separatorStyle = .none
        popularAccommodationsView.separatorStyle = .none
        
        popularPlacesView.backgroundColor = .white
        popularAccommodationsView.backgroundColor = .white
        popularPlacesView.delegate = self
        popularPlacesView.dataSource = self
        popularAccommodationsView.delegate = self
        popularAccommodationsView.dataSource = self
        
        popularPlacesView.snp.makeConstraints {
            $0.top.equalTo(underLineView.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        popularAccommodationsView.snp.makeConstraints {
            $0.edges.equalTo(popularPlacesView)
        }
        
        // 첫 화면은 인기 장소가 보여지도록 설정
        popularPlacesView.isHidden = false
        popularAccommodationsView.isHidden = true
    }
    @objc
    private func changeSegmentedControlLinePosition(_ segment: UISegmentedControl) {
        // 선택된 인덱스에 따라 leadingDistance 계산
        let segmentWidth = segmentControl.bounds.width / CGFloat(segmentControl.numberOfSegments)
        let leadingDistance = CGFloat(segment.selectedSegmentIndex) * segmentWidth
        
        UIView.animate(withDuration: 0.3) {
            // underLineView의 leading constraint를 업데이트
            self.underLineView.snp.updateConstraints {
                $0.leading.equalTo(self.segmentControl.snp.leading).offset(leadingDistance)
            }
            // 부모 뷰의 레이아웃을 즉시 업데이트
            self.view.layoutIfNeeded()
        }
    }
    
    
    @objc
    private func didChangeValue(_ segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            print("인기장소")
            popularPlacesView.isHidden = false
            popularAccommodationsView.isHidden = true
        case 1:
            print("인기숙소")
            popularPlacesView.isHidden = true
            popularAccommodationsView.isHidden = false
            
        default:
            print("hi")
            break
        }
    }
}


extension ThirdViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text?.lowercased() else { return }
        print("text:\(text)")
    }
}


extension ThirdViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 각각의 테이블 뷰에 표시할 항목 수 반환
        return 10 // 예시로 10개로 설정
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        var text = ""
        
        if tableView == popularPlacesView {
            text = "\(indexPath.row + 1)  인기 장소 검색어"
        } else if tableView == popularAccommodationsView {
            text = "\(indexPath.row + 1)  인기 숙소 검색어"
        }
        
        // NSMutableAttributedString 생성
        let attributedText = NSMutableAttributedString(string: text)
        
        // 첫 번째 숫자 부분만 빨간색으로 설정
        if indexPath.row < 3 {
            // "1 ", "2 ", "3 " 각각의 범위에 맞게 설정
            attributedText.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 2))
            attributedText.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 2, length: text.count - 2))
        } else {
            // 모든 텍스트를 검은색으로 설정
            attributedText.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 0, length: text.count))
        }
        
        cell.textLabel?.attributedText = attributedText
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // 클릭한 검색어에 따라 새로운 화면으로 이동하는 로직을 작성
        let keyword = tableView == popularPlacesView ? "인기 장소 검색어 \(indexPath.row + 1)" : "인기 숙소 검색어 \(indexPath.row + 1)"
        print("Selected keyword: \(keyword)")
        // 검색 결과 화면으로 이동하는 로직
    }
}
