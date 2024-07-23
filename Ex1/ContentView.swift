//
//  ContentView.swift
//  Ex1
//
//  Created by Dobrovsky on 23.07.2024.
//

import SwiftUI

// Определяем структуру ContentView, которая соответствует протоколу View
struct ContentView: View {
    // @State указывает на изменяемое состояние компонента
    // private var items инициализируется массивом чисел от 0 до 1 (исключая 1)
    @State private var items = Array(0..<1)

    // Определяем тело представления, которое возвращает некое View
    var body: some View {
        // ScrollView используется для создания вертикально прокручиваемого контейнера
        ScrollView {
            // LazyVStack оптимизирует загрузку элементов, загружая их только по мере необходимости
            LazyVStack {
                // ForEach перебирает элементы массива items и создает для каждого элемента представление
                ForEach(items, id: \.self) { item in
                    // Отображаем текст с номером текущего элемента
                    Text("Item \(item)")
                        // Добавляем отступы вокруг текста
                        .padding()
                        // Используем модификатор onAppear для выполнения действий при появлении элемента на экране
                        .onAppear {
                            // Проверяем, является ли текущий элемент последним в списке
                            if item == items.last {
                                // Если это последний элемент, загружаем новые элементы
                                loadMoreItems()
                            }
                        }
                }
            }
        }
    }
    
    // Определяем приватный метод для загрузки новых элементов в список
    private func loadMoreItems() {
        // Создаем диапазон новых элементов, начиная с текущего количества элементов
        let newItems = items.count..<items.count + 2
        // Добавляем новые элементы в конец массива items
        items.append(contentsOf: newItems)
    }
}


#Preview {
    ContentView()
}
