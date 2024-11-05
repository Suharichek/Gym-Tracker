//
//  Exercise.swift
//  GymTracker
//
//  Created by Сухарик on 05.11.2024.
//

import Foundation

struct Exercise: Identifiable {
    let id = UUID()
    var name: String
    var weight: Double? // nil, если используется продолжительность
    var duration: Double? // nil, если используется вес
    var sets: Int
}

