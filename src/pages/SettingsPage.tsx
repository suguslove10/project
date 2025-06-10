
import { Layout } from "@/components/Layout"
import { Card, CardContent } from "@/components/ui/card"
import { Settings } from "lucide-react"

const SettingsPage = () => {
  return (
    <Layout>
      <div className="space-y-4 sm:space-y-6 animate-fade-in container-responsive">
        <h1 className="heading-responsive font-bold text-foreground mb-2">Settings</h1>
        <Card className="bg-card border-border">
          <CardContent className="p-4 sm:p-6">
            <div className="flex items-center gap-3">
              <Settings className="h-5 w-5 text-foreground" />
              <span className="text-responsive">Application settings and configuration options</span>
            </div>
          </CardContent>
        </Card>
      </div>
    </Layout>
  )
}

export default SettingsPage
