//
//  Workout.swift
//  GymTracker
//
//  Created by Сухарик on 05.11.2024.
//

import Foundation

struct Workout: Identifiable {
    let id = UUID()
    var title: String
    var exercises: [Exercise]
    var duration: TimeInterval // Время в секундах
    var date: Date
}

