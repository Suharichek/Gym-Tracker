//
//  ExerciseListViewModel.swift
//  GymTracker
//
//  Created by Сухарик on 05.11.2024.
//

import Foundation

struct ExerciseStatistics {
    let name: String
    var totalSets: Int
    var totalDuration: Double
}

class ExerciseListViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
        init() {
            // Инициализация массива популярных упражнений
            exercises = [
                Exercise(name: "Push-Up", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Squat", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Deadlift", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Bench Press", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Lunges", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Pull-Up", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Plank", weight: nil, duration: 60, sets: 3), // Пример с длительностью
                Exercise(name: "Bicep Curl", weight: 10, duration: nil, sets: 3), // Пример с весом
                Exercise(name: "Tricep Dip", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Burpee", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Mountain Climber", weight: nil, duration: 60, sets: 3),
                Exercise(name: "Jumping Jack", weight: nil, duration: 60, sets: 3),
                Exercise(name: "Leg Press", weight: 50, duration: nil, sets: 3),
                Exercise(name: "Shoulder Press", weight: 20, duration: nil, sets: 3),
                Exercise(name: "Chest Fly", weight: 15, duration: nil, sets: 3),
                Exercise(name: "Leg Raise", weight: nil, duration: 60, sets: 3),
                Exercise(name: "Side Plank", weight: nil, duration: 30, sets: 3),
                Exercise(name: "Glute Bridge", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Crunch", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Russian Twist", weight: 5, duration: nil, sets: 3),
                Exercise(name: "Dumbbell Row", weight: 25, duration: nil, sets: 3),
                Exercise(name: "Cable Pull Down", weight: 30, duration: nil, sets: 3),
                Exercise(name: "Lateral Raise", weight: 10, duration: nil, sets: 3),
                Exercise(name: "Leg Curl", weight: 40, duration: nil, sets: 3),
                Exercise(name: "Calf Raise", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Ab Roller", weight: nil, duration: 30, sets: 3),
                Exercise(name: "Kettlebell Swing", weight: 15, duration: nil, sets: 3),
                Exercise(name: "Box Jump", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Medicine Ball Slam", weight: 10, duration: nil, sets: 3),
                Exercise(name: "Chest Press", weight: 40, duration: nil, sets: 3),
                Exercise(name: "Face Pull", weight: 15, duration: nil, sets: 3),
                Exercise(name: "Hip Thrust", weight: 50, duration: nil, sets: 3),
                Exercise(name: "Incline Bench Press", weight: 30, duration: nil, sets: 3),
                Exercise(name: "Dumbbell Fly", weight: 15, duration: nil, sets: 3),
                Exercise(name: "Seated Row", weight: 40, duration: nil, sets: 3),
                Exercise(name: "Dumbbell Snatch", weight: 20, duration: nil, sets: 3),
                Exercise(name: "Battle Ropes", weight: nil, duration: 30, sets: 3),
                Exercise(name: "Sled Push", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Pistol Squat", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Skater Jumps", weight: nil, duration: 60, sets: 3),
                Exercise(name: "Tire Flip", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Wall Sit", weight: nil, duration: 60, sets: 3),
                Exercise(name: "Zercher Squat", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Single-leg Deadlift", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Kneeling Press", weight: 15, duration: nil, sets: 3),
                Exercise(name: "Plank to Push-Up", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Reverse Lunge", weight: nil, duration: nil, sets: 3),
                Exercise(name: "Cobra Stretch", weight: nil, duration: 60, sets: 1),
                Exercise(name: "Bicycle Crunch", weight: nil, duration: 60, sets: 3),
                Exercise(name: "Superman", weight: nil, duration: 30, sets: 3),
                Exercise(name: "Flutter Kicks", weight: nil, duration: 30, sets: 3),
                Exercise(name: "Toe Touch", weight: nil, duration: nil, sets: 1),
                Exercise(name: "Hip Flexor Stretch", weight: nil, duration: 60, sets: 1),
                Exercise(name: "Shoulder Stretch", weight: nil, duration: 60, sets: 1),
                Exercise(name: "Seated Hamstring Stretch", weight: nil, duration: 60, sets: 1),
                Exercise(name: "Cat-Cow Stretch", weight: nil, duration: 60, sets: 1),
                Exercise(name: "Child’s Pose", weight: nil, duration: 60, sets: 1),
                Exercise(name: "Tricep Stretch", weight: nil, duration: 60, sets: 1),
            ]
        }
    var workouts: [Workout] = [] // Массив для хранения тренировок

    func addExercise(_ exercise: Exercise) {
        exercises.append(exercise)
    }

    func deleteExercise(at index: Int) {
        exercises.remove(at: index)
    }

    func calculateStatistics(for month: Int, year: Int) -> [ExerciseStatistics] {
        var stats: [ExerciseStatistics] = []
        let calendar = Calendar.current
        
        for workout in workouts {
            // Проверяем, находится ли дата тренировки в заданном месяце и году
            if calendar.component(.month, from: workout.date) == month,
               calendar.component(.year, from: workout.date) == year {
                
                for exercise in workout.exercises {
                    if let index = stats.firstIndex(where: { $0.name == exercise.name }) {
                        // Если упражнение уже есть в статистике, обновляем его
                        stats[index].totalSets += exercise.sets
                        stats[index].totalDuration += exercise.duration ?? 0
                    } else {
                        // Если упражнения нет, добавляем новое
                        stats.append(ExerciseStatistics(name: exercise.name, totalSets: exercise.sets, totalDuration: exercise.duration ?? 0))
                    }
                }
            }
        }
        
        return stats
    }
}


//import Foundation
//
//class ExerciseListViewModel: ObservableObject {
//    @Published var exercises: [Exercise] = []
//
//    init() {
//        // Инициализация массива популярных упражнений
//        exercises = [
//            Exercise(name: "Push-Up", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Squat", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Deadlift", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Bench Press", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Lunges", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Pull-Up", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Plank", weight: nil, duration: 60, sets: 3), // Пример с длительностью
//            Exercise(name: "Bicep Curl", weight: 10, duration: nil, sets: 3), // Пример с весом
//            Exercise(name: "Tricep Dip", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Burpee", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Mountain Climber", weight: nil, duration: 60, sets: 3),
//            Exercise(name: "Jumping Jack", weight: nil, duration: 60, sets: 3),
//            Exercise(name: "Leg Press", weight: 50, duration: nil, sets: 3),
//            Exercise(name: "Shoulder Press", weight: 20, duration: nil, sets: 3),
//            Exercise(name: "Chest Fly", weight: 15, duration: nil, sets: 3),
//            Exercise(name: "Leg Raise", weight: nil, duration: 60, sets: 3),
//            Exercise(name: "Side Plank", weight: nil, duration: 30, sets: 3),
//            Exercise(name: "Glute Bridge", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Crunch", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Russian Twist", weight: 5, duration: nil, sets: 3),
//            Exercise(name: "Dumbbell Row", weight: 25, duration: nil, sets: 3),
//            Exercise(name: "Cable Pull Down", weight: 30, duration: nil, sets: 3),
//            Exercise(name: "Lateral Raise", weight: 10, duration: nil, sets: 3),
//            Exercise(name: "Leg Curl", weight: 40, duration: nil, sets: 3),
//            Exercise(name: "Calf Raise", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Ab Roller", weight: nil, duration: 30, sets: 3),
//            Exercise(name: "Kettlebell Swing", weight: 15, duration: nil, sets: 3),
//            Exercise(name: "Box Jump", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Medicine Ball Slam", weight: 10, duration: nil, sets: 3),
//            Exercise(name: "Chest Press", weight: 40, duration: nil, sets: 3),
//            Exercise(name: "Face Pull", weight: 15, duration: nil, sets: 3),
//            Exercise(name: "Hip Thrust", weight: 50, duration: nil, sets: 3),
//            Exercise(name: "Incline Bench Press", weight: 30, duration: nil, sets: 3),
//            Exercise(name: "Dumbbell Fly", weight: 15, duration: nil, sets: 3),
//            Exercise(name: "Seated Row", weight: 40, duration: nil, sets: 3),
//            Exercise(name: "Dumbbell Snatch", weight: 20, duration: nil, sets: 3),
//            Exercise(name: "Battle Ropes", weight: nil, duration: 30, sets: 3),
//            Exercise(name: "Sled Push", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Pistol Squat", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Skater Jumps", weight: nil, duration: 60, sets: 3),
//            Exercise(name: "Tire Flip", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Wall Sit", weight: nil, duration: 60, sets: 3),
//            Exercise(name: "Zercher Squat", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Single-leg Deadlift", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Kneeling Press", weight: 15, duration: nil, sets: 3),
//            Exercise(name: "Plank to Push-Up", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Reverse Lunge", weight: nil, duration: nil, sets: 3),
//            Exercise(name: "Cobra Stretch", weight: nil, duration: 60, sets: 1),
//            Exercise(name: "Bicycle Crunch", weight: nil, duration: 60, sets: 3),
//            Exercise(name: "Superman", weight: nil, duration: 30, sets: 3),
//            Exercise(name: "Flutter Kicks", weight: nil, duration: 30, sets: 3),
//            Exercise(name: "Toe Touch", weight: nil, duration: nil, sets: 1),
//            Exercise(name: "Hip Flexor Stretch", weight: nil, duration: 60, sets: 1),
//            Exercise(name: "Shoulder Stretch", weight: nil, duration: 60, sets: 1),
//            Exercise(name: "Seated Hamstring Stretch", weight: nil, duration: 60, sets: 1),
//            Exercise(name: "Cat-Cow Stretch", weight: nil, duration: 60, sets: 1),
//            Exercise(name: "Child’s Pose", weight: nil, duration: 60, sets: 1),
//            Exercise(name: "Tricep Stretch", weight: nil, duration: 60, sets: 1),
//        ]
//    }
//
//    func addExercise(_ exercise: Exercise) {
//        exercises.append(exercise)
//    }
//
//    func deleteExercise(at offsets: IndexSet) {
//        exercises.remove(atOffsets: offsets)
//    }
//    
//    func calculateStatistics(for month: Int, year: Int) -> [ExerciseStatistics] {
//        var stats: [ExerciseStatistics] = []
//        let calendar = Calendar.current
//        
//        for workout in workouts {
//            // Проверяем, находится ли дата тренировки в заданном месяце и году
//            if calendar.component(.month, from: workout.date) == month,
//               calendar.component(.year, from: workout.date) == year {
//                
//                for exercise in workout.exercises {
//                    if let index = stats.firstIndex(where: { $0.name == exercise.name }) {
//                        // Если упражнение уже есть в статистике, обновляем его
//                        stats[index].totalSets += exercise.sets
//                        stats[index].totalDuration += exercise.duration ?? 0
//                    } else {
//                        // Если упражнения нет, добавляем новое
//                        stats.append(ExerciseStatistics(name: exercise.name, totalSets: exercise.sets, totalDuration: exercise.duration ?? 0))
//                    }
//                }
//            }
//        }
//        
//        return stats
//    }
//
//}
