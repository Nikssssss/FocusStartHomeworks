//
//  HobbyService.swift
//  Autobiography
//
//  Created by Никита Гусев on 15.05.2021.
//

import Foundation

protocol HobbyServiceProtocol: class {
    var allHobbies: [Hobby] { get }
    func initializeHobbies()
}

class HobbyService: HobbyServiceProtocol {
    private var hobbies = [Hobby]()
    
    var allHobbies: [Hobby] {
        return hobbies
    }
    
    func initializeHobbies() {
        self.hobbies.append(Hobby(hobbyTitle: "Киберспорт",
                                  hobbyDescription: "Чаще всего в свободное от учёбы время я смотрю турниры по CS:GO, болею за команду NaVi. NaVi дави!!!"))
        self.hobbies.append(Hobby(hobbyTitle: "Хоккей", hobbyDescription: "Помимо киберспорта я иногда могу посмотреть матчи по хоккею. По моему мнению, это самый интересный для просмотра вид спорта благодаря его динамичности"))
        self.hobbies.append(Hobby(hobbyTitle: "Путешествия", hobbyDescription: "Интересно, кто не любит путешествовать? Вот я не из таких. Если бы позволяли финансы, я бы путешествовал каждые полгода"))
        self.hobbies.append(Hobby(hobbyTitle: "Фитнес", hobbyDescription: "Долгое время я занимался спортом, а точнее ходил в тренажерный зал. Но сейчас забросил из-за нехватки времени в связи с разнообразной учебой"))
        self.hobbies.append(Hobby(hobbyTitle: "Фитнес", hobbyDescription: "Долгое время я занимался спортом, а точнее ходил в тренажерный зал. Но сейчас забросил из-за нехватки времени в связи с разнообразной учебой"))
        self.hobbies.append(Hobby(hobbyTitle: "Фитнес", hobbyDescription: "Долгое время я занимался спортом, а точнее ходил в тренажерный зал. Но сейчас забросил из-за нехватки времени в связи с разнообразной учебой"))
    }
}
