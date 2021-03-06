//
//  SettingsView.swift
//  Playzlib
//
//  Created by Laurens on 25.04.20.
//  Copyright © 2020 Laurens. All rights reserved.
//

import SwiftUI

struct SettingsToggle {
    var allowSimultaneouslyPlays: Bool = Settings.getSetting(setting: .AllowSimultaneouslyPlays) {
        didSet {
            Settings.setSetting(setting: .AllowSimultaneouslyPlays, value: allowSimultaneouslyPlays)
        }
    }
    var disableCreationDate: Bool = Settings.getSetting(setting: .DisableCreationDate) {
        didSet {
            Settings.setSetting(setting: .DisableCreationDate, value: disableCreationDate)
        }
    }
}

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var settings = SettingsToggle()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section() {
                        VStack {
                            HStack {
                                Spacer()
                                Image("createPlayzIcon").resizable().scaledToFit().padding(.bottom, 4)
                                Spacer()
                            }
                            Text("Playzlib").font(.system(size: 25, design: .rounded)).fontWeight(.bold).foregroundColor(Color("accentColor"))
                        }.padding()
                        
                    }.frame(height: 200)
                    Section(header: Text("SETTINGS")) {
                        List {
                            VStack {
                                Toggle(isOn: $settings.allowSimultaneouslyPlays) {
                                    HStack {
                                        Image(systemName: "play.circle")
                                        Text("Allow simultaneous plays")
                                    }
                                }
                            }
                            VStack {
                                Toggle(isOn: $settings.disableCreationDate) {
                                    HStack {
                                        Image(systemName: "calendar")
                                        Text("Hide creation date in list")
                                    }
                                }
                            }
                        }
                    }
                    Section(header: Text("ABOUT")) {
                        List {
                            Button(action: openWebsite) {
                                HStack {
                                    Text("Developer").foregroundColor(colorScheme == .dark ? Color.white : Color(UIColor.darkText))
                                    Spacer()
                                    Text("Laurens K.").foregroundColor(Color.gray)
                                }
                            }
                            Button(action: openTwitter) {
                                HStack {
                                    Text("Twitter").foregroundColor(colorScheme == .dark ? Color.white : Color(UIColor.darkText))
                                    Spacer()
                                    Text("@laurensk").foregroundColor(Color.gray)
                                }
                            }
                            Button(action: openMail) {
                                HStack {
                                    Text("Contact").foregroundColor(colorScheme == .dark ? Color.white : Color(UIColor.darkText))
                                    Spacer()
                                    Text("hello@laurensk.at").foregroundColor(Color.gray)
                                }
                            }
                            
                        }
                    }
                }.listStyle(GroupedListStyle())
                    .environment(\.horizontalSizeClass, .regular)
            }.navigationBarTitle("Settings & More")
                .navigationViewStyle(StackNavigationViewStyle())
        }.navigationViewStyle(StackNavigationViewStyle())
            .onAppear {
                self.setupUI()
        }
    }
    
    func setupUI() {
        UISwitch.appearance().onTintColor = UIColor(named: "accentColor")
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .singleLine
        UITableView.appearance().allowsSelection = true
        UITableViewCell.appearance().selectionStyle = .default
    }
    
    func openWebsite() {
        UIApplication.shared.open(URL(string: "https://www.laurensk.at")!)
    }
    
    func openTwitter() {
        UIApplication.shared.open(URL(string: "https://twitter.com/laurensk")!)
    }
    
    func openMail() {
        UIApplication.shared.open(URL(string: "mailto:hello@laurensk.at")!)
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
