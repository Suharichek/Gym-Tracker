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
                    Stepper("Duration: \(Int(duration)) seconds", value: $duration, in: 0...3600)
                }
            }
            .navigationTitle("Add Workout")
            .navigationBarItems(trailing: Button("Save") {
                saveWorkout()
                presentationMode.wrappedValue.dismiss()
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



