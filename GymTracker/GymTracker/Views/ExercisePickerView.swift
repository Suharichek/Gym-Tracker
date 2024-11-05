//
//  ExercisePickerView.swift
//  GymTracker
//
//  Created by Сухарик on 05.11.2024.
//

import SwiftUI

struct ExercisePickerView: View {
    @ObservedObject var viewModel: ExerciseListViewModel
    @Binding var selectedExercises: [Exercise]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.exercises) { exercise in
                    Button(action: {
                        addExercise(exercise)
                    }) {
                        Text(exercise.name)
                    }
                }
            }
            .navigationTitle("Select Exercise")
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }

    private func addExercise(_ exercise: Exercise) {
        // Проверка на уникальность, чтобы избежать дублирования
        if !selectedExercises.contains(where: { $0.id == exercise.id }) {
            selectedExercises.append(exercise)
        }
        presentationMode.wrappedValue.dismiss() // Закрыть выбор упражнения
    }
}

