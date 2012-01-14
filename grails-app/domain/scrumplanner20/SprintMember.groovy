package scrumplanner20

class SprintMember
{
    Person person
    Sprint sprint
    ScrumRole role = ScrumRole.MEMBER //default
    double dailyHours = 5 //default
    Integer daysOff = 0 //default

    static belongsTo = [Person, Sprint]

    static constraints = {
        sprint(nullable: false)
        person(nullable: false)
        role()
        dailyHours(minSize: 1)
        daysOff(min: 0, nullable: false)
    }

    String toString()
    {
        "${person} working in sprint ${sprint}"
    }
}
