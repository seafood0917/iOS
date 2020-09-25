//
//  ContentView.swift
//  TaskList
//
//  Created by Daesik on 9/24/20.
//  Copyright © 2020 Daesik. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var taskStore: TaskStore
    @State var modalIsPresented = false
    var body: some View {
//        List(taskStore.tasks.indices) { item in
//            Text(self.taskStore.tasks[item].name)
//        }
        NavigationView {
            List(taskStore.tasks) { task in
                Text(task.name)
            }.navigationBarTitle("Tasks")
            .navigationBarItems(trailing:
            Button(action: {self.modalIsPresented = true}){
                Image(systemName: "plus")})
        }.sheet(isPresented: $modalIsPresented, content: {
            NewTaskView()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskStore: TaskStore())
    }
}
