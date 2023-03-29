//
//  NavigationMenuView.swift
//  SAAGE
//
//  Created by manraj thind on 2022-01-20.
//

import SwiftUI

let headerHeight: CGFloat = CGFloat(50);

enum NavigationItems: String, CaseIterable {
    case myCarePlan = "My Care Plan"
    case howToUse = "How to use"
    case about = "About"
    case logout = "Logout"
    case login = "Login"
    case signUp = "Signup"
    case verifyEmail = "Verify email"
}

extension NavigationItems: Identifiable {
    var id: RawValue { rawValue }
}

struct Menu: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @Binding var showMenu: Bool
    
    var resetView: () -> ()
    
    var body: some View {
        let privateNavItems: [NavigationItems] = [.myCarePlan, .howToUse, .about, .logout]
        let publicNavItems: [NavigationItems] = [.about, .login, .signUp]
        
        VStack {
            ForEach(appViewModel.showPrivateViews ? privateNavItems : publicNavItems) { navigationItem in
                Text(navigationItem.rawValue)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(colorScheme == .light ? Color.black : Color.white)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .onTapGesture {
                        print("Clicked \(navigationItem.rawValue)")
                        
                        if navigationItem == .logout {
                            appViewModel.signOut()
                        } else {
                            appViewModel.view = navigationItem
                            resetView()
                        }
                        showMenu.toggle()
                    }
            }
        }.padding(.bottom).background(colorScheme == .light ? Color.white : Color.black)
    }
}

struct Header: View {
    @Binding var showMenu: Bool
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        HStack {
            Image(colorScheme == .light ? "MenuImage" : "MenuImageInverted")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.vertical, 10)
                .frame(height: headerHeight)
                .onTapGesture {
                    showMenu = !showMenu
                }
            Spacer()
            Image(colorScheme == .light ? "Logo" : "LogoInverted")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: headerHeight)
        }
    }
}

struct NavigationMenuView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @State private var carePlanView: CarePlanViews = .carePlanOptions
    @State private var showMenu: Bool = false
    
    var body: some View {
        return NavigationView {
            VStack {
                Header(showMenu: $showMenu)
                    .padding(.horizontal, 20)
                ZStack(alignment: .topLeading) {
                    containedView().padding(.horizontal, 40)
                    if showMenu {
                        Menu(showMenu: $showMenu, resetView: resetView)
                            .padding(.horizontal, 20)
                    }
                }
                Spacer()
            }.navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle()).onAppear {
            appViewModel.formViewModel.loadFormData(userId: appViewModel.user?.uid)
        }
    }
}

extension NavigationMenuView {
    func containedView() -> AnyView {
        switch appViewModel.view {
            case .myCarePlan: return AnyView(MyCarePlanView(carePlanView: $carePlanView))
            case .howToUse: return AnyView(HowToUseView())
            case .about: return AnyView(AboutView())
            case .login: return AnyView(LoginView())
            case .signUp: return AnyView(SignupView())
            case .verifyEmail: return AnyView(VerifyEmailView())
            default: return AnyView(Text(appViewModel.view.rawValue))
        }
    }
    
    func resetView() {
        switch appViewModel.view {
            case .myCarePlan:
                carePlanView = .carePlanOptions
            default:
                print("No matching view to reset")
        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationMenuView()
            .environmentObject(AppViewModel())
    }
}
