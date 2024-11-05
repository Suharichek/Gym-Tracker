//
//  ContentView.swift
//  GymTracker
//
//  Created by Сухарик on 05.11.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var workoutViewModel = WorkoutListViewModel()
    @StateObject private var exerciseViewModel = ExerciseListViewModel()

    var body: some View {
        TabView {
            // Экран "Список тренировок"
            NavigationView {
                WorkoutListView(viewModel: workoutViewModel)
            }
            .tabItem {
                Label("Workouts", systemImage: "heart.fill")
            }

            // Экран "Упражнения"
            NavigationView {
                ExerciseListView(viewModel: exerciseViewModel) { exercise in
                    // Можно добавить функциональность для обработки выбора упражнения
                }
            }
            .tabItem {
                Label("Exercises", systemImage: "figure.walk")
            }

            // Экран "Статистика"
            NavigationView {
                StatisticsView(workoutViewModel: workoutViewModel)
            }
            .tabItem {
                Label("Statistics", systemImage: "chart.bar")
            }
        }
    }
}


