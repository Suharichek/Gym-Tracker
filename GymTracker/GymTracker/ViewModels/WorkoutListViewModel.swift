//
//  WorkoutListViewModel.swift
//  GymTracker
//
//  Created by Сухарик on 05.11.2024.
//

import Foundation
import Combine

class WorkoutListViewModel: ObservableObject {
    @Published var workouts: [Workout] = []
    
    func addWorkout(title: String, exercises: [Exercise], duration: TimeInterval) {
        let newWorkout = Workout(title: title, exercises: exercises, duration: duration, date: Date())
        workouts.append(newWorkout)
    }
    
    func deleteWorkout(at offsets: IndexSet) {
        workouts.remove(atOffsets: offsets)
    }
}

