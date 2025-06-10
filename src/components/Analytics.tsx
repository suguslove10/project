import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, BarChart, Bar, PieChart, Pie, Cell } from "recharts"
import { TrendingUp, Users, MapPin, DollarSign } from "lucide-react"

const monthlyData = [
  { month: "Jan", requests: 45, approved: 42, cost: 85000 },
  { month: "Feb", requests: 52, approved: 48, cost: 92000 },
  { month: "Mar", requests: 38, approved: 35, cost: 78000 },
  { month: "Apr", requests: 61, approved: 58, cost: 105000 },
  { month: "May", requests: 49, approved: 46, cost: 89000 },
  { month: "Jun", requests: 55, approved: 52, cost: 98000 }
]

const departmentData = [
  { department: "Sales", requests: 120, cost: 240000 },
  { department: "Marketing", requests: 85, cost: 170000 },
  { department: "Engineering", requests: 95, cost: 185000 },
  { department: "Management", requests: 45, cost: 135000 },
  { department: "Support", requests: 65, cost: 98000 }
]

const destinationData = [
  { destination: "London", count: 45, value: 25 },
  { destination: "Singapore", count: 38, value: 20 },
  { destination: "New York", count: 35, value: 18 },
  { destination: "Tokyo", count: 32, value: 17 },
  { destination: "Others", count: 50, value: 20 }
]

const COLORS = ['#8c6d73', '#e5e5e5', '#ffffff', '#8c6d73', '#e5e5e5']

export function Analytics() {
  const totalRequests = monthlyData.reduce((sum, item) => sum + item.requests, 0)
  const totalApproved = monthlyData.reduce((sum, item) => sum + item.approved, 0)
  const totalCost = departmentData.reduce((sum, item) => sum + item.cost, 0)
  const avgCostPerTrip = Math.round(totalCost / totalApproved)

  return (
    <div className="space-y-6 animate-fade-in">
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-foreground mb-2">Travel Analytics</h1>
        <p className="text-muted-foreground">Comprehensive insights into travel patterns and expenses</p>
      </div>

      {/* Key Metrics - 2 columns on mobile, 4 on larger screens */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-3 sm:gap-6">
        <Card className="border-l-4" style={{ borderLeftColor: '#8c6d73' }}>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-xs sm:text-sm font-medium">Total Requests</CardTitle>
            <TrendingUp className="h-3 w-3 sm:h-4 sm:w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-lg sm:text-2xl font-bold">{totalRequests}</div>
            <p className="text-xs text-muted-foreground">+12% from last month</p>
          </CardContent>
        </Card>

        <Card className="border-l-4" style={{ borderLeftColor: '#8c6d73' }}>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-xs sm:text-sm font-medium">Approved</CardTitle>
            <Users className="h-3 w-3 sm:h-4 sm:w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-lg sm:text-2xl font-bold">{totalApproved}</div>
            <p className="text-xs text-muted-foreground">{Math.round((totalApproved / totalRequests) * 100)}% approval rate</p>
          </CardContent>
        </Card>

        <Card className="border-l-4" style={{ borderLeftColor: '#e5e5e5' }}>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-xs sm:text-sm font-medium">Total Cost</CardTitle>
            <DollarSign className="h-3 w-3 sm:h-4 sm:w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-lg sm:text-2xl font-bold">${Math.round(totalCost / 1000)}k</div>
            <p className="text-xs text-muted-foreground">This year</p>
          </CardContent>
        </Card>

        <Card className="border-l-4" style={{ borderLeftColor: '#e5e5e5' }}>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-xs sm:text-sm font-medium">Avg Cost</CardTitle>
            <MapPin className="h-3 w-3 sm:h-4 sm:w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-lg sm:text-2xl font-bold">${avgCostPerTrip}</div>
            <p className="text-xs text-muted-foreground">Per trip</p>
          </CardContent>
        </Card>
      </div>

      {/* Charts Grid */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Monthly Requests Chart */}
        <Card>
          <CardHeader>
            <CardTitle>Monthly Travel Requests</CardTitle>
          </CardHeader>
          <CardContent>
            <ResponsiveContainer width="100%" height={300}>
              <LineChart data={monthlyData}>
                <CartesianGrid strokeDasharray="3 3" stroke="#e5e5e5" />
                <XAxis dataKey="month" />
                <YAxis />
                <Tooltip />
                <Line type="monotone" dataKey="requests" stroke="#8c6d73" strokeWidth={2} />
                <Line type="monotone" dataKey="approved" stroke="#e5e5e5" strokeWidth={2} />
              </LineChart>
            </ResponsiveContainer>
          </CardContent>
        </Card>

        {/* Department Spending Chart */}
        <Card>
          <CardHeader>
            <CardTitle>Department Spending</CardTitle>
          </CardHeader>
          <CardContent>
            <ResponsiveContainer width="100%" height={300}>
              <BarChart data={departmentData}>
                <CartesianGrid strokeDasharray="3 3" stroke="#e5e5e5" />
                <XAxis dataKey="department" />
                <YAxis />
                <Tooltip />
                <Bar dataKey="cost" fill="#8c6d73" />
              </BarChart>
            </ResponsiveContainer>
          </CardContent>
        </Card>

        {/* Top Destinations Chart */}
        <Card>
          <CardHeader>
            <CardTitle>Top Destinations</CardTitle>
          </CardHeader>
          <CardContent>
            <ResponsiveContainer width="100%" height={300}>
              <PieChart>
                <Pie
                  data={destinationData}
                  cx="50%"
                  cy="50%"
                  outerRadius={100}
                  fill="#8884d8"
                  dataKey="value"
                  label={({ destination, value }) => `${destination} (${value}%)`}
                >
                  {destinationData.map((entry, index) => (
                    <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
                  ))}
                </Pie>
                <Tooltip />
              </PieChart>
            </ResponsiveContainer>
          </CardContent>
        </Card>

        {/* Cost Trends Chart */}
        <Card>
          <CardHeader>
            <CardTitle>Monthly Cost Trends</CardTitle>
          </CardHeader>
          <CardContent>
            <ResponsiveContainer width="100%" height={300}>
              <LineChart data={monthlyData}>
                <CartesianGrid strokeDasharray="3 3" stroke="#e5e5e5" />
                <XAxis dataKey="month" />
                <YAxis />
                <Tooltip />
                <Line type="monotone" dataKey="cost" stroke="#8c6d73" strokeWidth={3} />
              </LineChart>
            </ResponsiveContainer>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
