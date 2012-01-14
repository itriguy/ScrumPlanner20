package scrumplanner20

class Team {
    String name
    Person teamLeader

    static hasMany = [sprints: Sprint]

    static constraints = {
        name(size:2..15 , blank: false)
        teamLeader(nullable: true)
    }

    static mapping = {
        teamLeader lazy:false
        sort name:"asc"
    }

    String toString()
    {
        name
    }
}
