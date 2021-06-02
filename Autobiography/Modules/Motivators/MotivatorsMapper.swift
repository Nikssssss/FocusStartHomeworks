//
//  MotivatorsMapper.swift
//  Autobiography
//
//  Created by Никита Гусев on 24.05.2021.
//

import Foundation

class MotivatorsMapper {
    static func mapToViewInfo(_ motivator: Motivator) -> MotivatorViewInfo {
        let motivatorViewInfo = MotivatorViewInfo(name: motivator.name, imageUrl: motivator.imageUrl)
        return motivatorViewInfo
    }
}
