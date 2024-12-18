workspace {

    model {
        u = person "Marcus"
        ss = softwareSystem "Software System Modeling"

        u -> ss "Teaches"
    }

    views {
        systemContext ss {
            include *
            autolayout lr
        }
    }
    
}
