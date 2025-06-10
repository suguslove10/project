import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Badge } from "@/components/ui/badge"
import { MapPin, Calendar, DollarSign, Plane, CheckCircle, Hotel } from "lucide-react"

const travelHistory = [
  {
    id: 1,
    destination: "London, UK",
    purpose: "Client meeting and contract review",
    startDate: "2024-05-15",
    endDate: "2024-05-18",
    cost: "$2,850",
    status: "completed",
    department: "Management",
    hotel: {
      name: "The Langham London",
      address: "1C Portland Place, Regent Street, London W1B 1JA",
      checkIn: "2024-05-15",
      checkOut: "2024-05-18",
      cost: "$1,200"
    }
  },
  {
    id: 2,
    destination: "Singapore",
    purpose: "Regional manager conference",
    startDate: "2024-04-22",
    endDate: "2024-04-25",
    cost: "$3,200",
    status: "completed",
    department: "Management",
    hotel: {
      name: "Marina Bay Sands",
      address: "10 Bayfront Avenue, Singapore 018956",
      checkIn: "2024-04-22",
      checkOut: "2024-04-25",
      cost: "$1,800"
    }
  },
  {
    id: 3,
    destination: "New York, USA",
    purpose: "Board meeting and strategy session",
    startDate: "2024-03-10",
    endDate: "2024-03-14",
    cost: "$3,500",
    status: "completed",
    department: "Management",
    hotel: {
      name: "The Plaza Hotel",
      address: "768 5th Ave, New York, NY 10019",
      checkIn: "2024-03-10",
      checkOut: "2024-03-14",
      cost: "$2,100"
    }
  },
  {
    id: 4,
    destination: "Tokyo, Japan",
    purpose: "Partnership negotiations",
    startDate: "2024-02-18",
    endDate: "2024-02-22",
    cost: "$4,100",
    status: "completed",
    department: "Management",
    hotel: {
      name: "Park Hyatt Tokyo",
      address: "3-7-1-2 Nishi Shinjuku, Shinjuku City, Tokyo 163-1055",
      checkIn: "2024-02-18",
      checkOut: "2024-02-22",
      cost: "$2,800"
    }
  },
  {
    id: 5,
    destination: "Berlin, Germany",
    purpose: "Annual leadership summit",
    startDate: "2024-01-28",
    endDate: "2024-02-01",
    cost: "$2,400",
    status: "completed",
    department: "Management",
    hotel: {
      name: "Hotel Adlon Kempinski",
      address: "Unter den Linden 77, 10117 Berlin",
      checkIn: "2024-01-28",
      checkOut: "2024-02-01",
      cost: "$1,500"
    }
  },
  {
    id: 6,
    destination: "Barcelona, Spain",
    purpose: "Industry conference and networking",
    startDate: "2023-12-05",
    endDate: "2023-12-08",
    cost: "$2,100",
    status: "completed",
    department: "Management",
    hotel: {
      name: "Hotel Casa Fuster",
      address: "Passeig de Gràcia, 132, 08008 Barcelona",
      checkIn: "2023-12-05",
      checkOut: "2023-12-08",
      cost: "$900"
    }
  }
]

export function ViewHistory() {
  const totalSpent = travelHistory.reduce((sum, trip) => sum + parseInt(trip.cost.replace('$', '').replace(',', '')), 0)
  const totalTrips = travelHistory.length

  return (
    <div className="space-y-6 animate-fade-in">
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-foreground mb-2">Travel History</h1>
        <p className="text-muted-foreground">Your complete travel history with hotel and flight details</p>
      </div>

      {/* Summary Cards */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-3 sm:gap-6 mb-6">
        <Card className="border-l-4" style={{ borderLeftColor: '#8c6d73' }}>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-xs sm:text-sm font-medium">Total Trips</CardTitle>
            <Plane className="h-3 w-3 sm:h-4 sm:w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-lg sm:text-2xl font-bold">{totalTrips}</div>
            <p className="text-xs text-muted-foreground">This year</p>
          </CardContent>
        </Card>

        <Card className="border-l-4" style={{ borderLeftColor: '#8c6d73' }}>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-xs sm:text-sm font-medium">Total Spent</CardTitle>
            <DollarSign className="h-3 w-3 sm:h-4 sm:w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-lg sm:text-2xl font-bold">${(totalSpent/1000).toFixed(1)}k</div>
            <p className="text-xs text-muted-foreground">All trips</p>
          </CardContent>
        </Card>

        <Card className="border-l-4" style={{ borderLeftColor: '#e5e5e5' }}>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-xs sm:text-sm font-medium">Avg Cost</CardTitle>
            <Calendar className="h-3 w-3 sm:h-4 sm:w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-lg sm:text-2xl font-bold">${Math.round(totalSpent/totalTrips)}</div>
            <p className="text-xs text-muted-foreground">Per trip</p>
          </CardContent>
        </Card>

        <Card className="border-l-4" style={{ borderLeftColor: '#e5e5e5' }}>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-xs sm:text-sm font-medium">Status</CardTitle>
            <CheckCircle className="h-3 w-3 sm:h-4 sm:w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-lg sm:text-2xl font-bold">100%</div>
            <p className="text-xs text-muted-foreground">Completed</p>
          </CardContent>
        </Card>
      </div>

      {/* Travel History Cards */}
      <div className="grid gap-4 sm:gap-6">
        {travelHistory.map((trip) => (
          <Card key={trip.id} className="hover:shadow-lg transition-shadow">
            <CardHeader className="pb-4">
              <div className="flex items-center justify-between">
                <div>
                  <CardTitle className="text-lg flex items-center gap-2">
                    <MapPin className="h-5 w-5" style={{ color: '#8c6d73' }} />
                    {trip.destination}
                  </CardTitle>
                  <p className="text-sm text-muted-foreground mt-1">{trip.purpose}</p>
                </div>
                <Badge style={{ backgroundColor: '#8c6d73', color: 'white' }}>
                  <CheckCircle className="w-3 h-3 mr-1" />
                  Completed
                </Badge>
              </div>
            </CardHeader>
            <CardContent className="space-y-4">
              {/* Trip Details */}
              <div style={{ backgroundColor: '#f9f9f9' }} className="rounded-lg p-4">
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4 text-sm">
                  <div className="flex items-center gap-2">
                    <Calendar className="h-4 w-4 text-muted-foreground" />
                    <span>{trip.startDate} - {trip.endDate}</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <DollarSign className="h-4 w-4 text-muted-foreground" />
                    <span className="font-semibold">{trip.cost}</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <span className="text-muted-foreground">Department:</span>
                    <span className="font-medium">{trip.department}</span>
                  </div>
                </div>
              </div>

              {/* Flight Details */}
              <div className="bg-white border rounded-lg p-4">
                <h4 className="font-semibold text-sm mb-3 flex items-center gap-2">
                  <Plane className="h-4 w-4" style={{ color: '#8c6d73' }} />
                  Flight Details
                </h4>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-3 text-sm">
                  <div className="space-y-1">
                    <div className="flex justify-between">
                      <span className="text-muted-foreground">Departure:</span>
                      <span>{trip.startDate}</span>
                    </div>
                    <div className="flex justify-between">
                      <span className="text-muted-foreground">Return:</span>
                      <span>{trip.endDate}</span>
                    </div>
                  </div>
                  <div className="space-y-1">
                    <div className="flex justify-between">
                      <span className="text-muted-foreground">Destination:</span>
                      <span>{trip.destination}</span>
                    </div>
                    <div className="flex justify-between">
                      <span className="text-muted-foreground">Class:</span>
                      <span>Business</span>
                    </div>
                  </div>
                </div>
              </div>

              {/* Hotel Details */}
              <div className="bg-white border rounded-lg p-4">
                <h4 className="font-semibold text-sm mb-3 flex items-center gap-2">
                  <Hotel className="h-4 w-4" style={{ color: '#8c6d73' }} />
                  Hotel Accommodation
                </h4>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-3 text-sm">
                  <div>
                    <p className="font-medium">{trip.hotel.name}</p>
                    <p className="text-muted-foreground text-xs">{trip.hotel.address}</p>
                  </div>
                  <div className="space-y-1">
                    <div className="flex justify-between">
                      <span className="text-muted-foreground">Check-in:</span>
                      <span>{trip.hotel.checkIn}</span>
                    </div>
                    <div className="flex justify-between">
                      <span className="text-muted-foreground">Check-out:</span>
                      <span>{trip.hotel.checkOut}</span>
                    </div>
                    <div className="flex justify-between">
                      <span className="text-muted-foreground">Cost:</span>
                      <span className="font-semibold">{trip.hotel.cost}</span>
                    </div>
                  </div>
                </div>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  )
}
