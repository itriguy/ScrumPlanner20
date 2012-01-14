package scrumplanner20

class Person
{
    String firstName
    String lastName
    String emailAddress

    static hasMany = [sprints: SprintMember, managedTeams: Team]

    static constraints = {
        firstName(size:3..20, blank: false)
        lastName(size:3..20, blank: false)
        emailAddress(email: true, nullable: true)
        managedTeams()
        sprints()
    }

    static mapping = {
        managedTeams sort:'name'
    }

    String toString()
    {
        "${firstName} ${lastName}"
    }
}