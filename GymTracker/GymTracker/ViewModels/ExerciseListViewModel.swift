//
//  ExerciseListViewModel.swift
//  GymTracker
//
//  Created by Сухарик on 05.11.2024.
//

import Foundation
import Combine

class ExerciseListViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
    
    func addExercise(name: String, weight: Double?, duration: Double?, sets: Int) {
        let newExercise = Exercise(name: name, weight: weight, duration: duration, sets: sets)
        exercises.append(newExercise)
    }
    
    func deleteExercise(at offsets: IndexSet) {
        exercises.remove(atOffsets: offsets)
    }
}

