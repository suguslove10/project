
import { useState } from "react"
import { SidebarProvider, SidebarTrigger } from "@/components/ui/sidebar"
import { TSLSidebar } from "@/components/TSLSidebar"
import { useLocation } from "react-router-dom"

interface LayoutProps {
  children: React.ReactNode
}

export function Layout({ children }: LayoutProps) {
  const location = useLocation()
  
  // Map routes to section keys for sidebar
  const routeToSection: { [key: string]: string } = {
    '/': 'dashboard',
    '/dashboard': 'dashboard',
    '/employee-info': 'employee-info',
    '/booking-requests': 'booking-requests',
    '/pending-requests': 'pending-requests',
    '/analytics': 'analytics',
    '/settings': 'settings'
  }
  
  const [activeSection, setActiveSection] = useState(routeToSection[location.pathname] || 'dashboard')

  return (
    <SidebarProvider>
      <div className="min-h-screen flex w-full bg-background">
        <div className="flex-1 flex flex-col min-w-0">
          <header className="border-b border-border bg-background px-4 sm:px-6 py-3 sm:py-4 flex items-center justify-between shrink-0">
            <div className="flex items-center gap-2 sm:gap-4 min-w-0">
              <div className="flex items-center gap-2 sm:gap-3 min-w-0">
                <div className="w-6 h-6 sm:w-8 sm:h-8 bg-primary rounded-lg flex items-center justify-center shrink-0">
                  <span className="text-primary-foreground font-bold text-xs sm:text-sm">TSL</span>
                </div>
                <div className="min-w-0">
                  <h1 className="font-semibold text-sm sm:text-lg truncate">Travel Solutions Ltd</h1>
                  <p className="text-xs text-muted-foreground hidden sm:block">Manager Dashboard</p>
                </div>
              </div>
            </div>
            <SidebarTrigger className="ml-auto shrink-0" />
          </header>

          <main className="flex-1 p-4 sm:p-6 overflow-auto">
            {children}
          </main>
        </div>

        <TSLSidebar activeSection={activeSection} setActiveSection={setActiveSection} />
      </div>
    </SidebarProvider>
  )
}
