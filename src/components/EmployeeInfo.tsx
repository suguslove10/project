
import { useState } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"
import { Dialog, DialogContent, DialogHeader, DialogTitle } from "@/components/ui/dialog"
import { MapPin, Calendar, DollarSign, User, Plane } from "lucide-react"

const employees = [
  {
    id: 1,
    name: "John Smith",
    department: "Sales",
    email: "john.smith@tsl.com",
    currentTrip: {
      destination: "London, UK",
      startDate: "2024-06-15",
      endDate: "2024-06-18",
      status: "active",
      budget: "$2,500"
    },
    upcomingTrips: [
      {
        destination: "Berlin, Germany",
        startDate: "2024-07-20",
        endDate: "2024-07-23",
        purpose: "Client meeting",
        budget: "$1,800"
      },
      {
        destination: "Milan, Italy",
        startDate: "2024-08-15",
        endDate: "2024-08-18",
        purpose: "Trade show",
        budget: "$2,200"
      }
    ],
    totalTrips: 15
  },
  {
    id: 2,
    name: "Sarah Johnson",
    department: "Marketing",
    email: "sarah.j@tsl.com",
    currentTrip: null,
    upcomingTrips: [
      {
        destination: "Barcelona, Spain",
        startDate: "2024-07-10",
        endDate: "2024-07-12",
        purpose: "Conference",
        budget: "$1,500"
      }
    ],
    totalTrips: 8
  },
  {
    id: 3,
    name: "Mike Chen",
    department: "Engineering",
    email: "mike.chen@tsl.com",
    currentTrip: {
      destination: "Tokyo, Japan",
      startDate: "2024-06-12",
      endDate: "2024-06-20",
      status: "active",
      budget: "$4,200"
    },
    upcomingTrips: [],
    totalTrips: 22
  },
  {
    id: 4,
    name: "Emily Davis",
    department: "HR",
    email: "emily.davis@tsl.com",
    currentTrip: null,
    upcomingTrips: [
      {
        destination: "Amsterdam, Netherlands",
        startDate: "2024-07-05",
        endDate: "2024-07-07",
        purpose: "HR Summit",
        budget: "$1,200"
      },
      {
        destination: "Zurich, Switzerland",
        startDate: "2024-08-01",
        endDate: "2024-08-03",
        purpose: "Training",
        budget: "$1,800"
      },
      {
        destination: "Stockholm, Sweden",
        startDate: "2024-09-10",
        endDate: "2024-09-12",
        purpose: "Workshop",
        budget: "$1,600"
      }
    ],
    totalTrips: 12
  }
]

export function EmployeeInfo() {
  const [selectedEmployee, setSelectedEmployee] = useState<typeof employees[0] | null>(null)
  const [isDialogOpen, setIsDialogOpen] = useState(false)

  const openUpcomingTrips = (employee: typeof employees[0]) => {
    setSelectedEmployee(employee)
    setIsDialogOpen(true)
  }

  return (
    <div className="space-y-6 animate-fade-in">
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-foreground mb-2">Employee Travel Information</h1>
        <p className="text-muted-foreground">Monitor current and upcoming employee travel</p>
      </div>

      <div className="grid gap-6">
        {employees.map((employee) => (
          <Card key={employee.id} className="overflow-hidden">
            <CardHeader className="pb-4">
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-4">
                  <Avatar className="h-12 w-12">
                    <AvatarImage src="" />
                    <AvatarFallback style={{ backgroundColor: '#8c6d73', color: 'white' }}>
                      {employee.name.split(' ').map(n => n[0]).join('')}
                    </AvatarFallback>
                  </Avatar>
                  <div>
                    <CardTitle className="text-lg">{employee.name}</CardTitle>
                    <p className="text-sm text-muted-foreground flex items-center gap-2">
                      <User className="h-3 w-3" />
                      {employee.department} • {employee.email}
                    </p>
                  </div>
                </div>
                <div className="text-right">
                  <p className="text-sm text-muted-foreground">Total Trips</p>
                  <p className="text-2xl font-bold">{employee.totalTrips}</p>
                </div>
              </div>
            </CardHeader>
            <CardContent className="space-y-4">
              {employee.currentTrip ? (
                <div style={{ backgroundColor: '#f9f9f9', borderColor: '#e5e5e5' }} className="border rounded-lg p-4">
                  <div className="flex items-center justify-between mb-3">
                    <h4 className="font-semibold" style={{ color: '#8c6d73' }}>Current Trip</h4>
                    <Badge style={{ backgroundColor: '#8c6d73', color: 'white' }}>
                      Active
                    </Badge>
                  </div>
                  <div className="grid grid-cols-1 md:grid-cols-3 gap-4 text-sm">
                    <div className="flex items-center gap-2">
                      <MapPin className="h-4 w-4" style={{ color: '#8c6d73' }} />
                      <span>{employee.currentTrip.destination}</span>
                    </div>
                    <div className="flex items-center gap-2">
                      <Calendar className="h-4 w-4" style={{ color: '#8c6d73' }} />
                      <span>{employee.currentTrip.startDate} - {employee.currentTrip.endDate}</span>
                    </div>
                    <div className="flex items-center gap-2">
                      <DollarSign className="h-4 w-4" style={{ color: '#8c6d73' }} />
                      <span>{employee.currentTrip.budget}</span>
                    </div>
                  </div>
                </div>
              ) : (
                <div style={{ backgroundColor: '#f9f9f9', borderColor: '#e5e5e5' }} className="border rounded-lg p-4">
                  <p className="text-muted-foreground text-sm">No current active trip</p>
                </div>
              )}
              
              <div className="flex items-center justify-between text-sm">
                <span className="text-muted-foreground">Upcoming trips:</span>
                <Badge 
                  style={{ 
                    backgroundColor: employee.upcomingTrips.length > 0 ? '#8c6d73' : '#e5e5e5',
                    color: employee.upcomingTrips.length > 0 ? 'white' : '#666',
                    cursor: employee.upcomingTrips.length > 0 ? 'pointer' : 'default'
                  }}
                  onClick={() => employee.upcomingTrips.length > 0 && openUpcomingTrips(employee)}
                  className={employee.upcomingTrips.length > 0 ? 'hover:opacity-80 transition-opacity' : ''}
                >
                  {employee.upcomingTrips.length} scheduled
                </Badge>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* Upcoming Trips Dialog */}
      <Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
        <DialogContent className="max-w-2xl">
          <DialogHeader>
            <DialogTitle className="flex items-center gap-2">
              <Plane className="h-5 w-5" />
              Upcoming Trips - {selectedEmployee?.name}
            </DialogTitle>
          </DialogHeader>
          
          {selectedEmployee && (
            <div className="space-y-4">
              {selectedEmployee.upcomingTrips.length > 0 ? (
                selectedEmployee.upcomingTrips.map((trip, index) => (
                  <div key={index} className="border rounded-lg p-4 space-y-3" style={{ borderColor: '#e5e5e5' }}>
                    <div className="flex items-center justify-between">
                      <h4 className="font-semibold text-lg">{trip.destination}</h4>
                      <Badge style={{ backgroundColor: '#8c6d73', color: 'white' }}>
                        Scheduled
                      </Badge>
                    </div>
                    
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                      <div>
                        <p className="text-sm font-medium text-muted-foreground">Travel Dates</p>
                        <div className="flex items-center gap-2">
                          <Calendar className="h-4 w-4 text-muted-foreground" />
                          <span>{trip.startDate} - {trip.endDate}</span>
                        </div>
                      </div>
                      <div>
                        <p className="text-sm font-medium text-muted-foreground">Budget</p>
                        <div className="flex items-center gap-2">
                          <DollarSign className="h-4 w-4 text-muted-foreground" />
                          <span>{trip.budget}</span>
                        </div>
                      </div>
                    </div>
                    
                    <div>
                      <p className="text-sm font-medium text-muted-foreground">Purpose</p>
                      <p className="mt-1">{trip.purpose}</p>
                    </div>
                  </div>
                ))
              ) : (
                <div className="text-center py-8">
                  <p className="text-muted-foreground">No upcoming trips scheduled</p>
                </div>
              )}
            </div>
          )}
        </DialogContent>
      </Dialog>
    </div>
  )
}
