
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import { ExternalLink, Plus, Calendar, MapPin, DollarSign } from "lucide-react"
import { useToast } from "@/hooks/use-toast"

const bookingRequests = [
  {
    id: 1,
    employeeName: "Alice Wilson",
    department: "Sales",
    destination: "New York, USA",
    purpose: "Client meeting",
    startDate: "2024-06-25",
    endDate: "2024-06-27",
    estimatedCost: "$1,800",
    priority: "high",
    status: "draft"
  },
  {
    id: 2,
    employeeName: "Robert Martinez",
    department: "Engineering",
    destination: "Berlin, Germany",
    purpose: "Conference attendance",
    startDate: "2024-07-10",
    endDate: "2024-07-14",
    estimatedCost: "$3,200",
    priority: "medium",
    status: "draft"
  }
]

export function BookingRequests() {
  const { toast } = useToast()

  const handleRedirectToBooking = () => {
    toast({
      title: "Redirecting to Employee Booking System",
      description: "Opening the employee booking request portal...",
    })
    // In a real app, this would redirect to the employee booking system
  }

  const handleViewRequest = (requestId: number) => {
    toast({
      title: "Opening Request Details",
      description: `Viewing details for request #${requestId}`,
    })
  }

  return (
    <div className="space-y-6 animate-fade-in">
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-foreground mb-2">Booking Requests</h1>
        <p className="text-muted-foreground">Access employee booking system and view draft requests</p>
      </div>

      {/* Redirect to Employee Booking System */}
      <Card className="border-2 border-dashed border-primary/30">
        <CardContent className="flex flex-col items-center justify-center py-12">
          <div className="rounded-full bg-primary/10 p-6 mb-4">
            <ExternalLink className="h-8 w-8 text-primary" />
          </div>
          <h3 className="text-xl font-semibold mb-2">Employee Booking System</h3>
          <p className="text-muted-foreground text-center mb-6 max-w-md">
            Redirect to the employee booking request system where staff can submit new travel requests
          </p>
          <Button 
            onClick={handleRedirectToBooking}
            className="bg-primary hover:bg-primary/90 text-primary-foreground"
            size="lg"
          >
            <ExternalLink className="w-4 h-4 mr-2" />
            Access Employee Booking Portal
          </Button>
        </CardContent>
      </Card>

      {/* Draft Requests */}
      <div>
        <div className="flex items-center justify-between mb-6">
          <h2 className="text-xl font-semibold">Draft Requests Overview</h2>
          <Badge variant="secondary">{bookingRequests.length} drafts</Badge>
        </div>

        <div className="grid gap-4">
          {bookingRequests.map((request) => (
            <Card key={request.id} className="hover:shadow-md transition-shadow">
              <CardHeader className="pb-3">
                <div className="flex items-center justify-between">
                  <CardTitle className="text-lg">{request.employeeName}</CardTitle>
                  <Badge 
                    variant={request.priority === 'high' ? 'destructive' : 
                            request.priority === 'medium' ? 'default' : 'secondary'}
                  >
                    {request.priority} priority
                  </Badge>
                </div>
                <p className="text-sm text-muted-foreground">{request.department} • {request.purpose}</p>
              </CardHeader>
              <CardContent className="space-y-4">
                <div className="grid grid-cols-1 md:grid-cols-3 gap-4 text-sm">
                  <div className="flex items-center gap-2">
                    <MapPin className="h-4 w-4 text-muted-foreground" />
                    <span>{request.destination}</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <Calendar className="h-4 w-4 text-muted-foreground" />
                    <span>{request.startDate} - {request.endDate}</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <DollarSign className="h-4 w-4 text-muted-foreground" />
                    <span>{request.estimatedCost}</span>
                  </div>
                </div>
                
                <div className="flex items-center justify-between pt-2">
                  <Badge variant="outline" className="text-xs">
                    Draft Status
                  </Badge>
                  <Button 
                    variant="outline" 
                    size="sm"
                    onClick={() => handleViewRequest(request.id)}
                  >
                    View Details
                  </Button>
                </div>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>
    </div>
  )
}
