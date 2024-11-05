//
//  AddExerciseView.swift
//  GymTracker
//
//  Created by Сухарик on 05.11.2024.
//

import SwiftUI

struct AddExerciseView: View {
    @ObservedObject var viewModel: ExerciseListViewModel
    @State private var name: String = ""
    @State private var weight: Double?
    @State private var duration: Double?
    @State private var sets: Int = 1

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Exercise Name")) {
                    TextField("Name", text: $name)
                }
                Section(header: Text("Weight or Duration")) {
                    TextField("Weight (kg)", value: $weight, formatter: NumberFormatter())
                    TextField("Duration (min)", value: $duration, formatter: NumberFormatter())
                }
                Section(header: Text("Sets")) {
                    Stepper("Sets: \(sets)", value: $sets, in: 1...10)
                }
            }
            .navigationTitle("Add Exercise")
            .navigationBarItems(trailing: Button("Save") {
                viewModel.addExercise(name: name, weight: weight, duration: duration, sets: sets)
            })
        }
    }
}

