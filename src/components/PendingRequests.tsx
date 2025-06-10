
import { useState } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import { Dialog, DialogContent, DialogHeader, DialogTitle } from "@/components/ui/dialog"
import { Textarea } from "@/components/ui/textarea"
import { CheckCircle, XCircle, Clock, MapPin, Calendar, DollarSign, FileText, User } from "lucide-react"
import { useToast } from "@/hooks/use-toast"

const pendingRequests = [
  {
    id: 1,
    employeeName: "David Kim",
    department: "Sales",
    destination: "Paris, France",
    purpose: "Client presentation and contract negotiation",
    startDate: "2024-07-01",
    endDate: "2024-07-05",
    estimatedCost: "$2,800",
    priority: "high",
    submittedDate: "2024-06-08",
    details: "Important client meeting to finalize Q3 partnership agreement. Required for revenue targets."
  },
  {
    id: 2,
    employeeName: "Lisa Rodriguez",
    department: "Marketing",
    destination: "Barcelona, Spain",
    purpose: "Industry conference and networking",
    startDate: "2024-07-15",
    endDate: "2024-07-18",
    estimatedCost: "$2,200",
    priority: "medium",
    submittedDate: "2024-06-09",
    details: "Annual marketing conference with key industry leaders. Opportunity for brand partnerships."
  },
  {
    id: 3,
    employeeName: "James Thompson",
    department: "Engineering",
    destination: "Singapore",
    purpose: "Technical training and certification",
    startDate: "2024-08-05",
    endDate: "2024-08-12",
    estimatedCost: "$4,500",
    priority: "low",
    submittedDate: "2024-06-10",
    details: "Advanced cloud architecture certification program. Will enhance team capabilities."
  }
]

export function PendingRequests() {
  const [requests, setRequests] = useState(pendingRequests)
  const [selectedRequest, setSelectedRequest] = useState<typeof pendingRequests[0] | null>(null)
  const [isDialogOpen, setIsDialogOpen] = useState(false)
  const [approvalNotes, setApprovalNotes] = useState("")
  const { toast } = useToast()

  const handleApprove = (requestId: number) => {
    setRequests(requests.filter(req => req.id !== requestId))
    toast({
      title: "Request Approved",
      description: "The travel request has been approved and forwarded to TSL Administration.",
    })
    setIsDialogOpen(false)
    setApprovalNotes("")
  }

  const handleReject = (requestId: number) => {
    setRequests(requests.filter(req => req.id !== requestId))
    toast({
      title: "Request Rejected",
      description: "The travel request has been rejected and removed from the list.",
      variant: "destructive",
    })
    setIsDialogOpen(false)
    setApprovalNotes("")
  }

  const openRequestDetails = (request: typeof pendingRequests[0]) => {
    setSelectedRequest(request)
    setIsDialogOpen(true)
  }

  if (requests.length === 0) {
    return (
      <div className="space-y-6 animate-fade-in">
        <div className="mb-8">
          <h1 className="text-3xl font-bold text-foreground mb-2">Pending Requests</h1>
          <p className="text-muted-foreground">Review and approve employee travel requests</p>
        </div>
        
        <Card className="text-center py-12">
          <CardContent>
            <CheckCircle className="h-16 w-16 mx-auto mb-4" style={{ color: '#8c6d73' }} />
            <h3 className="text-xl font-semibold mb-2">No Pending Requests</h3>
            <p className="text-muted-foreground">All travel requests have been processed. Great job!</p>
          </CardContent>
        </Card>
      </div>
    )
  }

  return (
    <div className="space-y-6 animate-fade-in">
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-foreground mb-2">Pending Requests</h1>
        <p className="text-muted-foreground">Review and approve employee travel requests</p>
      </div>

      <div className="flex items-center justify-between mb-6">
        <Badge 
          variant="outline" 
          style={{ backgroundColor: '#f9f9f9', color: '#8c6d73', borderColor: '#e5e5e5' }}
        >
          <Clock className="w-3 h-3 mr-1" />
          {requests.length} requests pending review
        </Badge>
      </div>

      <div className="grid gap-4 sm:gap-6">
        {requests.map((request) => (
          <Card key={request.id} className="border border-gray-200 rounded-lg shadow-sm">
            <CardHeader className="pb-3">
              <div className="flex items-start justify-between">
                <div className="flex items-center gap-3">
                  <div className="w-10 h-10 rounded-full bg-gray-100 flex items-center justify-center">
                    <User className="w-5 h-5 text-gray-600" />
                  </div>
                  <div>
                    <CardTitle className="text-lg font-semibold">{request.employeeName}</CardTitle>
                    <p className="text-sm text-gray-600">{request.department}</p>
                    <p className="text-xs text-gray-500">Submitted {request.submittedDate}</p>
                  </div>
                </div>
                <Badge 
                  className="text-xs px-2 py-1"
                  style={{ 
                    backgroundColor: request.priority === 'high' ? '#8c6d73' : '#e5e5e5',
                    color: request.priority === 'high' ? 'white' : '#666'
                  }}
                >
                  {request.priority}
                </Badge>
              </div>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="bg-gray-50 rounded-lg p-3">
                <p className="font-medium text-sm mb-1">Purpose:</p>
                <p className="text-sm text-gray-700">{request.purpose}</p>
              </div>
              
              <div className="grid grid-cols-1 gap-3 text-sm">
                <div className="flex items-center gap-2">
                  <MapPin className="h-4 w-4 text-gray-500" />
                  <span>{request.destination}</span>
                </div>
                <div className="flex items-center gap-2">
                  <Calendar className="h-4 w-4 text-gray-500" />
                  <span>{request.startDate} - {request.endDate}</span>
                </div>
                <div className="flex items-center gap-2">
                  <DollarSign className="h-4 w-4 text-gray-500" />
                  <span>{request.estimatedCost}</span>
                </div>
              </div>
              
              <div className="flex flex-col sm:flex-row gap-2 pt-2">
                <Button 
                  onClick={() => openRequestDetails(request)}
                  variant="outline"
                  size="sm"
                  className="w-full sm:w-auto"
                >
                  <FileText className="w-4 h-4 mr-2" />
                  View Details
                </Button>
                <div className="flex gap-2">
                  <Button 
                    onClick={() => handleApprove(request.id)}
                    style={{ backgroundColor: '#8c6d73' }}
                    className="text-white hover:opacity-90 flex-1 sm:flex-none"
                    size="sm"
                  >
                    <CheckCircle className="w-4 h-4 mr-2" />
                    Approve
                  </Button>
                  <Button 
                    onClick={() => handleReject(request.id)}
                    style={{ backgroundColor: '#e5e5e5', color: '#666' }}
                    className="hover:opacity-90 flex-1 sm:flex-none"
                    size="sm"
                  >
                    <XCircle className="w-4 h-4 mr-2" />
                    Reject
                  </Button>
                </div>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* Request Details Dialog */}
      <Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
        <DialogContent className="max-w-2xl">
          <DialogHeader>
            <DialogTitle>Request Details - {selectedRequest?.employeeName}</DialogTitle>
          </DialogHeader>
          
          {selectedRequest && (
            <div className="space-y-6">
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <p className="text-sm font-medium text-muted-foreground">Employee</p>
                  <p className="font-medium">{selectedRequest.employeeName}</p>
                </div>
                <div>
                  <p className="text-sm font-medium text-muted-foreground">Department</p>
                  <p className="font-medium">{selectedRequest.department}</p>
                </div>
                <div>
                  <p className="text-sm font-medium text-muted-foreground">Destination</p>
                  <p className="font-medium">{selectedRequest.destination}</p>
                </div>
                <div>
                  <p className="text-sm font-medium text-muted-foreground">Estimated Cost</p>
                  <p className="font-medium">{selectedRequest.estimatedCost}</p>
                </div>
                <div>
                  <p className="text-sm font-medium text-muted-foreground">Travel Dates</p>
                  <p className="font-medium">{selectedRequest.startDate} - {selectedRequest.endDate}</p>
                </div>
                <div>
                  <p className="text-sm font-medium text-muted-foreground">Priority</p>
                  <Badge variant={selectedRequest.priority === 'high' ? 'destructive' : 'default'}>
                    {selectedRequest.priority}
                  </Badge>
                </div>
              </div>
              
              <div>
                <p className="text-sm font-medium text-muted-foreground mb-2">Purpose & Details</p>
                <div className="bg-muted/30 rounded-lg p-4">
                  <p className="text-sm">{selectedRequest.details}</p>
                </div>
              </div>
              
              <div>
                <p className="text-sm font-medium text-muted-foreground mb-2">Approval Notes (Optional)</p>
                <Textarea 
                  placeholder="Add any notes or conditions for this approval..."
                  value={approvalNotes}
                  onChange={(e) => setApprovalNotes(e.target.value)}
                  className="min-h-[80px]"
                />
              </div>
              
              <div className="flex justify-end gap-3">
                <Button variant="outline" onClick={() => setIsDialogOpen(false)}>
                  Close
                </Button>
                <Button 
                  style={{ backgroundColor: '#e5e5e5', color: '#666' }}
                  onClick={() => handleReject(selectedRequest.id)}
                >
                  <XCircle className="w-4 h-4 mr-2" />
                  Reject
                </Button>
                <Button 
                  style={{ backgroundColor: '#8c6d73' }}
                  className="text-white hover:opacity-90"
                  onClick={() => handleApprove(selectedRequest.id)}
                >
                  <CheckCircle className="w-4 h-4 mr-2" />
                  Approve & Forward
                </Button>
              </div>
            </div>
          )}
        </DialogContent>
      </Dialog>
    </div>
  )
}
