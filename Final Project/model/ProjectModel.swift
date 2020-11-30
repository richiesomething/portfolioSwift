//
//  ProjectModel.swift
//  Final Project
//
//  Created by Richard Hernandez on 11/18/20.
//

import UIKit

class ProjectModel: NSObject {
    
    public static let shared = ProjectModel()
    
    private var projects = [Project]()
    private var results = [Project]()
    private var filepath: String

    
    private var java = "java"
    private var c = "c"
    private var cpp = "cpp"
    private var python = "python"
    private var swift = "swift"
    private var js = "javascript"
    private var jq = "jquery"
    private var html = "html"
    private var css = "css"
    private var fx = "javafx"
    private var jsp = "jsp"
    private var backend = "backend"
    private var frontend = "frontend"
    private var tdd = "TDD"
    private var bdd = "BDD"
    private var junit = "junit"
    private var cucumber = "cucumber"
    private var gherkin = "gherkin"
    private var sql = "SQL"
    private var noSql = "NoSQL"
    private var chartjs = "ChartJS"
    private var web = "Web development"
    private var game = "Game development"
    private var iOS = "iOS development"
    private var yelp = "Yelp API"
    private var googleMaps = "Google Maps API"
    private var googleSignin = "Google Sign in"
    private var api = "API"
    private var AI = "AI"
    private var school = "school"
    private var personal = "personal"
    private var postman = "postman"
    private var node = "nodeJs"
    private var react = "reactJs"
    private var php = "php"
    private var robotics = "robotics"
    private var bootstrap = "bootstrap"
    
    private var financialTracker = "A dynamic web app that let users create acounts and track the value of their portfolio. They can see the stocks they currently own as well as see stocks they've owned in the past. The user can easily view their portfolio value on a graph presented at the top of their profile. The front end is written on JSP pages using Ajax to call the back end servlets which where written in Java. To ensure full functionality jUnit tests where implemented ensuring 100% branch and line coverage as well as behaviour tests using cucumber and gherkin. The app uses Yahoo's finace API to get and display the stock values."
    
    private var rhInfo = "An iOS app developed for my iOS Development Class. The user of this app can view some information about myself as well as share my info with potentially interested parties. The user can view my Linked in profile as well as my website. They also have the choice to email me directly from the app or share my resume with others. They can also browse a table displaying the projects I've worked on and can search for languages or technologies they use."
    
    private var cache = "A project to simulate a Cache. It works as both a LRU cache or FIFO cache. It was written using C."
    
    private var ping = "Ping is a project not too unlike the old game pong. It has many levels that the player has to work through, each getting increasingly harder. The game has many blocks and a ball that must be bouced off a board. The goal is to break all the blocks without letting the ball fall past the board. It was programed using javaFX."
    
    private var chess = "Chess because why not."
    
    private var neighbors = "A simulation made to model the moving patters of people based on their neighbors. Given certain constraints and starting conditions the simulation can predict the migration patters of humans. It is based off of Conway's Game of Life. It's is easy to extrapulate from this to a universal simulation, with some mental leaps of course. It was designed using javafx."
    
    private var notFlappyBird = "Did you know the creater of flappy bird erased his app because people where getting to addicted to it! Iphones that have the original flappy bird app downloaded are sold for thousands of dollars still! Anyways, this app looks a lot like that but its not that. An early attempt to teach myself coding and game development. It is done in python."
    
    private var snek = "Snake. No further explination nessasary. Designed in python"
    
    private var salsEats = "Sal's Eats in a web application used for finding your favorite restaurants close by. It allows you to search for a type of food or for a specific restaurant of your choice. You can also sort by closest, highest rating and more. You can use it as a guest or create an account for keeping track of your favorite places. The frontend design was written in HTML/CSS and jQuery was added to handle events. The backend consists of servlets written in Java and are called using AJAX. The backend takes care of validating login or signup forms as well as calling the Yelp API. It also sorts the response dynamically on the frontend. Also used is the Google Maps API for setting your search location and the Google Sign In API for easy signup and login."
    
    private var trojanTodo = "Trojan Todo is an easy to use iOS app, that aims to allow the user to keep track of their class standing. The user can create classes and assign each class exam's and assignment's with their appropriate grade weight. After completion the user can input the grade received and the app will keep track of the users current weighted grade for each class. The user can also add other `todo's` to allow them to keep track of necessary tasks. The front end design was written in swift while the backend was written in Java. The backend was used to validate login and signup forms as well as storing the data. To store the data we set up a database using MySQL which the servlets accessed with support of JDBC drivers. The database consisted of multiple tables linked with foreign keys to keep track of the users assignments and todo's."
    
    private var mazeSolver = "The goal of this project was to have a robot find the most efficient path through a maze. The robot was given the goal coordinates but it was not given its own location or the layout of the maze. Thus it first had to use several techniques to self localize, then plan the best route to take given its current location and the goal state. The robot and all algorithms were programmed using Python. We first tested the algorithms virtually using VREP then on an iRumba robot. The first task was to self localize. To do so we used a Particle Filtering Algorithm. We generated 1000 random particles on the maze which represented possible locations for the robot. Then as the robot moved particles not likely to be close to the actual position were removed and regenerated until the robot was localized. It then generated a rapidly exploring random tree to find the best route to the goal."
    
    private var bestTeam = "This is an application that helps the user pick the best team out of possible candidates. It uses AI algorithms such as Alpha-Beta pruning to make the best decision taking into account what the opposing team captain might do."
    
    private var taskManager = "This is a backend app for keeping track of tasks. It is developed using nodeJs. Postman was used to test the backend end points"
    
    private var chatApp = "An app developed using react and node. It allows the users to create private chat rooms and exchange messages with other users."
    
    private var weathApp = "A simple weather app to check the weather. This was an early attempt to teach myself reactJs. It uses the weather app api to query weather info. Postman was used to test the api calls"
    
    private var dice = "A simple app that uses can use to simulate rolling dice. An early attempt to teach myself swift."
    
    private var jakes = "A front end website for a free lance photographer."
    
    private var ko = "A front end website for a private gym"
    
    private var matr = "A dynamic web app for users looking for like and relationship advice. The app allows users to sign up for counseling and advice as well as browse testimonials from previous clients. It was written using html/css/js for the front end and the back end was written in PHP. An SQL database was set up for keeping track of clients."
    
    
    
    override init() {
        
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        filepath = url!.appendingPathComponent("projects.txt").path
        print("filepath=\(filepath)")
        
        // load data from file
        if manager.fileExists(atPath: filepath) {
            do {
                let data = try String(contentsOfFile: filepath, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                for line in myStrings {
                    if line.contains(":") {
                        let attributes = line.split(separator: ":")
                        let hashes = attributes[2].components(separatedBy: ",")
                        let project = Project(name: String(attributes[0]), language: String(attributes[1]), hashtags: hashes, description: String(attributes[3]))
                        projects.append(project)
                    }
                }
                results = projects
            } catch {
                print("Could not read file")
            }
        } else {
            
            print("no file exits")
            
            // fill with data
            projects.append(Project(name: "Financial Tracker", language: java, hashtags: [java, jsp, bootstrap, junit, cucumber, js, jq, chartjs, gherkin, web, api, frontend, backend, school, postman, sql], description: financialTracker))
            projects.append(Project(name: "RH.info", language: swift, hashtags: [school, swift], description: rhInfo))
            projects.append(Project(name: "Cache", language: c, hashtags: [c,school], description: cache))
            projects.append(Project(name: "Ping", language: java, hashtags: [java, fx, game, school], description: ping))
            projects.append(Project(name: "Chess", language: java, hashtags: [java, fx, game, personal], description: chess))
            projects.append(Project(name: "Neighbors", language: java, hashtags: [java, fx, game, school], description: neighbors))
            projects.append(Project(name: "Not Flappy Bird", language: python, hashtags: [python, game, personal], description: notFlappyBird))
            projects.append(Project(name: "Snek", language: python, hashtags: [python, game, personal], description: snek))
            projects.append(Project(name: "Sal's Eats", language: java, hashtags: [java, jsp, web, backend, frontend, bootstrap, googleMaps, googleSignin, api, school, postman, sql, yelp], description: salsEats))
            projects.append(Project(name: "Best Team", language: java, hashtags: [java, AI, school], description: bestTeam))
            projects.append(Project(name: "Task Manager", language: js, hashtags: [js, node, react, web, postman, api, personal, backend, noSql], description: taskManager))
            projects.append(Project(name: "Chat app", language: js, hashtags: [js, node, backend, web, postman, api, personal, noSql, bootstrap], description: chatApp))
            projects.append(Project(name: "Weater App", language: js, hashtags: [js, node, backend, frontend, postman, api, personal, web, bootstrap], description: weathApp))
            projects.append(Project(name: "Dice", language: swift, hashtags: [swift, personal, iOS], description: dice))
            projects.append(Project(name: "Jake's Photography", language: html, hashtags: [html, js, jq, css, web, bootstrap, frontend], description: jakes))
            projects.append(Project(name: "KO Gym", language: html, hashtags: [html, js, jq, css, web, frontend, bootstrap], description: ko))
            projects.append(Project(name: "Modern Approach to relationships", language: php, hashtags: [html, js, jq, css, bootstrap, web, frontend, backend, php, php], description: matr))
            projects.append(Project(name: "Trojan Todo", language: swift, hashtags: [java, sql, iOS], description: trojanTodo))
            projects.append(Project(name: "Robotic Maze Solver", language: python, hashtags: [python, AI, robotics], description: mazeSolver))
            
            results = projects
            
            // save funtionality
            var projectString = String()
            for project in projects {
                let desc = project.projectString
                projectString.append(desc)
            }
            do {
                try projectString.write(toFile: filepath, atomically: true, encoding: .utf8)
            } catch {
                print("Could not save to file")
            }
            
        }
        
    }
    
    func size() -> Int {
        return results.count
    }
    
    func project(at index: Int) -> Project? {
        return results[index]
    }
    
    func getProject(byName: String) -> Project? {
        for project in projects {
            if project.name == byName {
                return project
            }
        }
        return nil
    }

    func showProjects(thatHave: String) {

        results.removeAll()
        
        if thatHave == "" {
            results = projects
            return
        }
        
        for project in projects {
            
            if thatHave.lowercased() == project.language.lowercased() {
                results.append(project);
                continue
            }
            
            for hashtag in project.hashtags {
                
                if hashtag.lowercased().contains(thatHave.lowercased()) {
                    results.append(project)
                    continue
                }
                
                if thatHave.lowercased() == hashtag.lowercased() {
                    results.append(project)
                    continue
                }
                
            }
            
        }
    }
    
    func appendProjects(thatHave: String) {
        
        for project in projects {
            
            if (!results.contains(project)) {
                if thatHave.lowercased() == project.language.lowercased() {
                    results.append(project);
                    continue
                }
                
                for hashtag in project.hashtags {
                    
                    if thatHave.lowercased() == hashtag.lowercased() {
                        results.append(project)
                        continue
                    }
                    
                }
            }
            
        }
    }
    
}
