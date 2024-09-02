//
//  SettingViewModel.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/2/24.
//

import UIKit
import Combine

class SettingViewModel {
    @Published var items: [[String]] = [
        ["내가 작성한 글 목록"],
        ["개인정보 처리방침", "공지사항","앱정보"]
    ]
    
    @Published var sectionHeaders: [String] = ["나의 활동내역", "기타"]
    
}
