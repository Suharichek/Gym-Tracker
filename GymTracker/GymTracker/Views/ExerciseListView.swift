//
//  ExerciseListView.swift
//  GymTracker
//
//  Created by Сухарик on 05.11.2024.
//

import SwiftUI

struct ExerciseListView: View {
    @ObservedObject var viewModel: ExerciseListViewModel
    var onExerciseSelected: (Exercise) -> Void

    var body: some View {
        List {
            ForEach(viewModel.exercises) { exercise in
                Button(action: {
                    onExerciseSelected(exercise)
                }) {
                    Text(exercise.name)
                }
            }
        }
        .navigationTitle("Exercises")
        .navigationBarItems(trailing: NavigationLink(destination: AddExerciseView(viewModel: viewModel)) {
            Image(systemName: "plus")
        })
    }
}


