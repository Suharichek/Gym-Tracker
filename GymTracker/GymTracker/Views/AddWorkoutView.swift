//
//  AddWorkoutView.swift
//  GymTracker
//
//  Created by Сухарик on 05.11.2024.
//

import SwiftUI

struct AddWorkoutView: View {
    @ObservedObject var viewModel: WorkoutListViewModel
    @State private var title: String = ""
    @State private var selectedExercises: [Exercise] = []
    @State private var duration: TimeInterval = 0
    @State private var showExercisePicker = false // Для показа ExercisePickerView

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Workout Title")) {
                    TextField("Title", text: $title)
                }
                
                Section(header: Text("Exercises")) {
                    List {
                        ForEach(selectedExercises) { exercise in
                            Text(exercise.name)
                        }
                        .onDelete(perform: removeExercise)
                    }
                    Button("Add Exercise") {
                        showExercisePicker = true // Показать выбор упражнения
                    }
                    .sheet(isPresented: $showExercisePicker) {
                        ExercisePickerView(viewModel: ExerciseListViewModel(), selectedExercises: $selectedExercises)
                    }
                }
                
                Section(header: Text("Duration")) {
                    HStack {
                        Text("Duration: \(Int(duration / 60)) min \(Int(duration.truncatingRemainder(dividingBy: 60))) sec")
                        Slider(value: $duration, in: 0...3600, step: 1)
                    }
                }

            }
            .navigationTitle("Add Workout")
            .navigationBarItems(trailing: Button(action: {
                saveWorkout()
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "checkmark")
            })
        }
    }
    
    private func removeExercise(at offsets: IndexSet) {
        selectedExercises.remove(atOffsets: offsets)
    }

    private func saveWorkout() {
        let newWorkout = Workout(title: title, exercises: selectedExercises, duration: duration, date: Date())
        viewModel.workouts.append(newWorkout)
    }
}



