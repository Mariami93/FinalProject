//
//  InfoViewModel.swift
//  TeamWork
//
//  Created by Mariami on 7/5/21.
//

import Foundation

struct OnBoardingViewModel : Codable{

    private var infos: OnBoarding

    init(infos: OnBoarding) {
        self.infos = infos

    }

    var title: String {
        infos.title ?? ""
    }

    var imageUrl: URL? {
        URL(string: infos.imageUrl ?? "")
    }

    var text: String {
        infos.text ?? ""
    }
}

