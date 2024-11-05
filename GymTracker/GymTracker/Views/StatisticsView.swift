//
//  StatisticsView.swift
//  GymTracker
//
//  Created by Сухарик on 05.11.2024.
//

import SwiftUI

struct StatisticsView: View {
    @ObservedObject var workoutViewModel: WorkoutListViewModel

    var body: some View {
        VStack {
            // Здесь будет ваша логика отображения статистики
            List {
                ForEach(workoutViewModel.workouts) { workout in
                    VStack(alignment: .leading) {
                        Text(workout.title)
                            .font(.headline)
                        Text("Duration: \(Int(workout.duration)) seconds")
                        // Здесь можно добавить дополнительную статистику
                    }
                }
            }
        }
        .navigationTitle("Statistics")
    }
}


