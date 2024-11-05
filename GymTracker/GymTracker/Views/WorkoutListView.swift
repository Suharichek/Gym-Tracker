//
//  WorkoutListView.swift
//  GymTracker
//
//  Created by Сухарик on 05.11.2024.
//

import SwiftUI

struct WorkoutListView: View {
    @ObservedObject var viewModel: WorkoutListViewModel

    var body: some View {
        List {
            ForEach(viewModel.workouts) { workout in
                VStack(alignment: .leading) {
                    Text(workout.title)
                        .font(.headline)
                    Text("Duration: \(Int(workout.duration)) seconds")
                    Text("Exercises: \(workout.exercises.map { $0.name }.joined(separator: ", "))")
                }
            }
            .onDelete(perform: viewModel.deleteWorkout)
        }
        .navigationTitle("Workouts")
        .navigationBarItems(trailing: NavigationLink(destination: AddWorkoutView(viewModel: viewModel)) {
            Image(systemName: "plus")
        })
    }
}


