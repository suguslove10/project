
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, LineChart, Line, PieChart, Pie, Cell } from 'recharts'
import { Users, Clock, CheckCircle, XCircle, TrendingUp, Calendar } from "lucide-react"

const monthlyData = [
  { month: 'Jan', requests: 45, approved: 38, pending: 7 },
  { month: 'Feb', requests: 52, approved: 44, pending: 8 },
  { month: 'Mar', requests: 61, approved: 55, pending: 6 },
  { month: 'Apr', requests: 58, approved: 50, pending: 8 },
  { month: 'May', requests: 67, approved: 59, pending: 8 },
  { month: 'Jun', requests: 72, approved: 65, pending: 7 },
]

const statusData = [
  { name: 'Approved', value: 311, color: '#8c6d73' },
  { name: 'Pending', value: 44, color: '#e5e5e5' },
  { name: 'Rejected', value: 12, color: '#f5f5f5' },
]

const departmentData = [
  { department: 'Sales', requests: 89 },
  { department: 'Marketing', requests: 76 },
  { department: 'Engineering', requests: 124 },
  { department: 'HR', requests: 45 },
  { department: 'Finance', requests: 33 },
]

export function DashboardOverview() {
  const totalRequests = statusData.reduce((sum, item) => sum + item.value, 0)
  const approvalRate = ((statusData[0].value / totalRequests) * 100).toFixed(1)

  return (
    <div className="space-y-6 animate-fade-in">
      {/* Header */}
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-foreground mb-2">Manager Dashboard</h1>
        <p className="text-muted-foreground">Overview of travel requests and employee data</p>
      </div>

      {/* Key Metrics - 2 cards per row on mobile */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-3 sm:gap-6">
        <Card className="border-l-4" style={{ borderLeftColor: '#8c6d73' }}>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-xs sm:text-sm font-medium">Total Requests</CardTitle>
            <Users className="h-3 w-3 sm:h-4 sm:w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-lg sm:text-2xl font-bold">{totalRequests}</div>
            <p className="text-xs text-muted-foreground">+12% from last month</p>
          </CardContent>
        </Card>

        <Card className="border-l-4" style={{ borderLeftColor: '#8c6d73' }}>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-xs sm:text-sm font-medium">Approved</CardTitle>
            <CheckCircle className="h-3 w-3 sm:h-4 sm:w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-lg sm:text-2xl font-bold">{statusData[0].value}</div>
            <p className="text-xs text-muted-foreground">{approvalRate}% approval rate</p>
          </CardContent>
        </Card>

        <Card className="border-l-4" style={{ borderLeftColor: '#e5e5e5' }}>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-xs sm:text-sm font-medium">Pending</CardTitle>
            <Clock className="h-3 w-3 sm:h-4 sm:w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-lg sm:text-2xl font-bold">{statusData[1].value}</div>
            <p className="text-xs text-muted-foreground">Awaiting review</p>
          </CardContent>
        </Card>

        <Card className="border-l-4" style={{ borderLeftColor: '#e5e5e5' }}>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-xs sm:text-sm font-medium">Rejected</CardTitle>
            <XCircle className="h-3 w-3 sm:h-4 sm:w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-lg sm:text-2xl font-bold">{statusData[2].value}</div>
            <p className="text-xs text-muted-foreground">This month</p>
          </CardContent>
        </Card>
      </div>

      {/* Charts Row */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Monthly Trends */}
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2 text-sm sm:text-base">
              <TrendingUp className="h-4 w-4 sm:h-5 sm:w-5" />
              Monthly Request Trends
            </CardTitle>
          </CardHeader>
          <CardContent>
            <ResponsiveContainer width="100%" height={300}>
              <LineChart data={monthlyData}>
                <CartesianGrid strokeDasharray="3 3" stroke="#e5e5e5" />
                <XAxis dataKey="month" />
                <YAxis />
                <Tooltip />
                <Line type="monotone" dataKey="requests" stroke="#8c6d73" strokeWidth={3} />
                <Line type="monotone" dataKey="approved" stroke="#8c6d73" strokeWidth={2} opacity={0.7} />
                <Line type="monotone" dataKey="pending" stroke="#e5e5e5" strokeWidth={2} />
              </LineChart>
            </ResponsiveContainer>
          </CardContent>
        </Card>

        {/* Status Distribution */}
        <Card>
          <CardHeader>
            <CardTitle className="text-sm sm:text-base">Request Status Distribution</CardTitle>
          </CardHeader>
          <CardContent>
            <ResponsiveContainer width="100%" height={300}>
              <PieChart>
                <Pie
                  data={statusData}
                  cx="50%"
                  cy="50%"
                  outerRadius={100}
                  fill="#8884d8"
                  dataKey="value"
                  label={({ name, percent }) => `${name} ${(percent * 100).toFixed(0)}%`}
                >
                  {statusData.map((entry, index) => (
                    <Cell key={`cell-${index}`} fill={entry.color} />
                  ))}
                </Pie>
                <Tooltip />
              </PieChart>
            </ResponsiveContainer>
          </CardContent>
        </Card>
      </div>

      {/* Department Analysis */}
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2 text-sm sm:text-base">
            <Calendar className="h-4 w-4 sm:h-5 sm:w-5" />
            Requests by Department
          </CardTitle>
        </CardHeader>
        <CardContent>
          <ResponsiveContainer width="100%" height={300}>
            <BarChart data={departmentData}>
              <CartesianGrid strokeDasharray="3 3" stroke="#e5e5e5" />
              <XAxis dataKey="department" />
              <YAxis />
              <Tooltip />
              <Bar dataKey="requests" fill="#8c6d73" radius={[4, 4, 0, 0]} />
            </BarChart>
          </ResponsiveContainer>
        </CardContent>
      </Card>
    </div>
  )
}
