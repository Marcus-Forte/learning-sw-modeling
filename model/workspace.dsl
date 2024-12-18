workspace extends ws2.dsl {

    !identifiers hierarchical
    
    model {
        !include people.dsl

        ss = softwaresystem "Software" {
            container1 = container "Container1" {
                component1 = component "component1"
                component2 = component "component2"

                component1 -> component2

            }
            database = container "database" {
                tags "DB"
            }
            dashboard = container "dashboard"

            dashboard -> database "writes"
            dashboard -> container1 "uses"

        }
        # Relationships
        u_marcus -> ss.dashboard
        
    }

    views {
        !include style.dsl

        systemcontext ss "SS" {
            include *
            autolayout lr
        }

        container ss {
            include *
            autolayout lr
        }

        component ss.container1 {
            include *
            autolayout lr
        }

        dynamic ss.container1 {
            ss.container1.component1 -> ss.container1.component2 "msg"
            ss.container1.component2 -> ss.container1.component1 "msg"
            autolayout lr
        }
        

    }

    
}