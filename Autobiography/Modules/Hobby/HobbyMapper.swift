//
//  HobbyMapper.swift
//  Autobiography
//
//  Created by Никита Гусев on 25.05.2021.
//

import Foundation

class HobbyMapper {
    static func mapToHobbyViewInfo(_ hobby: Hobby) -> HobbyViewInfo {
        let hobbyViewInfo = HobbyViewInfo(hobbyTitle: hobby.hobbyTitle,
                                          hobbyDescription: hobby.hobbyDescription)
        return hobbyViewInfo
    }
}
