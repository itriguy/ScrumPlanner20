package scrumplanner20

class Sprint
{
    String name
    Team team
    Date sprintStart
    Date sprintEnd
    Integer workingDays
    String notes

    static hasMany = [members: SprintMember]
    static belongsTo = [team: Team]

    static constraints = {
        name(blank:false, maxSize: 30)
        team(blank:false)
        workingDays(minSize: 5, maxSize: 30)
        sprintStart(nullable: false)
        sprintEnd(nullable: false)
        members()
        notes(nullable: true, maxSize: 500)
    }

    List<Person> getScrumMasters()
    {
        List<Person> scrumMasters = []
        members.each{
            if(ScrumRole.SCRUM_MASTER.equals(it.role)){
                scrumMasters.add(it.person)
            }
        }
        return scrumMasters
    }
    
    double getHours(){
        double hours = 0.0 
        members.each { member ->
            hours += member.dailyHours * (workingDays - member.daysOff)
        }
        return hours
    }
    
    String toString()
    {
        return "${name} (${team})"
    }
}
