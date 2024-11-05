//
//  StatisticsView.swift
//  GymTracker
//
//  Created by Сухарик on 05.11.2024.
//

import SwiftUI

struct StatisticsView: View {
    @ObservedObject var workoutViewModel: ExerciseListViewModel // Предполагаем, что это ваш ViewModel
    @State private var selectedMonth = Calendar.current.component(.month, from: Date())
    @State private var selectedYear = Calendar.current.component(.year, from: Date())

    var body: some View {
        VStack {
            // Выбор месяца
            Picker("Month", selection: $selectedMonth) {
                ForEach(1...12, id: \.self) { month in
                    Text("\(month)").tag(month)
                }
            }
            .pickerStyle(SegmentedPickerStyle())

            // Выбор года
            Picker("Year", selection: $selectedYear) {
                ForEach(2020...2025, id: \.self) { year in
                    Text("\(year)").tag(year)
                }
            }
            .pickerStyle(MenuPickerStyle())

            List {
                let stats = workoutViewModel.calculateStatistics(for: selectedMonth, year: selectedYear)

                ForEach(stats, id: \.name) { stat in
                    VStack(alignment: .leading) {
                        Text(stat.name)
                            .font(.headline)
                        Text("Total Sets: \(stat.totalSets)")
                        Text("Total Duration: \(stat.totalDuration, specifier: "%.1f") minutes")
                    }
                }
            }
            .navigationTitle("Statistics")
        }
    }
}



//import SwiftUI
//
//struct StatisticsView: View {
//    @ObservedObject var workoutViewModel: WorkoutListViewModel
//
//    var body: some View {
//        VStack {
//            Text("Workout Statistics")
//                .font(.largeTitle)
//            
//            let totalWorkouts = workoutViewModel.workouts.count
//            let totalDuration = workoutViewModel.workouts.reduce(0) { $0 + $1.duration }
//
//            Text("Total Workouts: \(totalWorkouts)")
//            Text("Total Duration: \(Int(totalDuration / 60)) min \(Int(totalDuration.truncatingRemainder(dividingBy: 60))) sec")
//            
//            // Дополнительная логика для отображения статистики по упражнениям
//            // Например, можете сгруппировать статистику по конкретным упражнениям
//        }
//        .padding()
//    }
//}


