//
//  MotivatorsService.swift
//  Autobiography
//
//  Created by Никита Гусев on 15.05.2021.
//

import Foundation

protocol MotivatorsServiceProtocol: class {
    var numberOfMotivators: Int { get }
    func initializeMotivators()
    func getMotivator(at index: Int) -> Motivator?
}

class MotivatorsService: MotivatorsServiceProtocol {
    private var motivators = [Motivator]()
    
    var numberOfMotivators: Int {
        return motivators.count
    }
    
    func initializeMotivators() {
        self.motivators.append(Motivator(name: "Стив Джобс",
                                         imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Steve_Jobs_Headshot_2010-CROP.jpg/274px-Steve_Jobs_Headshot_2010-CROP.jpg"))
        self.motivators.append(Motivator(name: "Марк Цукерберг", imageUrl: "https://file.liga.net/images/general/2012/09/10/201209101614154080.jpg?v=1521737321"))
        self.motivators.append(Motivator(name: "Джефф Безос",
                                         imageUrl: "https://tech.24tv.ua/resources/photos/news/201808/1018181.jpg?1609253086000"))
        self.motivators.append(Motivator(name: "Павел Дуров",
                                         imageUrl: "https://ichef.bbci.co.uk/news/640/cpsprodpb/15F4F/production/_112953998_17569d45-47c1-48f4-bfad-ccf75b813f8e.jpg"))
    }
    
    func getMotivator(at index: Int) -> Motivator? {
        guard index >= 0, index < motivators.count else { return nil }
        return self.motivators[index]
    }
}
