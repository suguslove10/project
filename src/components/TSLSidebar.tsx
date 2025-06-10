
import {
  BarChart3,
  Users,
  Clock,
  LogOut,
  Bell,
  Home,
  User,
  History,
  Settings
} from "lucide-react"
import {
  Sidebar,
  SidebarContent,
  SidebarGroup,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarHeader,
  SidebarFooter,
} from "@/components/ui/sidebar"
import { useNavigate, useLocation } from "react-router-dom"

interface TSLSidebarProps {
  activeSection: string;
  setActiveSection: (section: string) => void;
}

const menuItems = [
  {
    title: "Dashboard",
    icon: Home,
    key: "dashboard",
    path: "/dashboard"
  },
  {
    title: "Pending Requests",
    icon: Clock,
    key: "pending-requests",
    path: "/pending-requests"
  },
  {
    title: "Employee Travel Info",
    icon: Users,
    key: "employee-info",
    path: "/employee-info"
  },
  {
    title: "View History",
    icon: History,
    key: "view-history",
    path: "/view-history"
  },
  {
    title: "Analytics",
    icon: BarChart3,
    key: "analytics",
    path: "/analytics"
  },
]

const profileItems = [
  {
    title: "My Profile",
    icon: User,
    key: "profile",
    path: "/profile"
  },
  {
    title: "Settings",
    icon: Settings,
    key: "settings",
    path: "/settings"
  },
]

const bottomItems = [
  {
    title: "Logout",
    icon: LogOut,
    key: "logout",
    path: "/logout"
  },
]

export function TSLSidebar({ activeSection, setActiveSection }: TSLSidebarProps) {
  const navigate = useNavigate()
  const location = useLocation()

  const handleNavigation = (key: string, path: string) => {
    setActiveSection(key)
    navigate(path)
  }

  const isActive = (key: string, path: string) => {
    return location.pathname === path || (key === 'dashboard' && location.pathname === '/')
  }

  return (
    <Sidebar side="right" className="border-l border-border bg-background">
      <SidebarHeader className="p-4 sm:p-6 border-b border-border">
        <div className="flex items-center gap-3">
          <div className="w-8 h-8 sm:w-10 sm:h-10 bg-primary rounded-lg flex items-center justify-center relative shrink-0">
            <span className="text-primary-foreground font-bold text-sm sm:text-lg">TSL</span>
            <User className="w-2 h-2 sm:w-3 sm:h-3 text-primary-foreground absolute -top-0.5 -right-0.5 sm:-top-1 sm:-right-1 bg-primary rounded-full p-0.5" />
          </div>
          <div className="min-w-0">
            <h2 className="font-semibold text-sm sm:text-lg truncate">John Manager</h2>
            <p className="text-xs sm:text-sm text-muted-foreground truncate">john.manager@tsl.com</p>
          </div>
        </div>
      </SidebarHeader>
      
      <SidebarContent className="p-3 sm:p-4">
        <SidebarGroup>
          <SidebarGroupLabel className="text-xs uppercase tracking-wider text-muted-foreground mb-3 sm:mb-4">
            Navigation
          </SidebarGroupLabel>
          <SidebarGroupContent>
            <SidebarMenu>
              {menuItems.map((item) => (
                <SidebarMenuItem key={item.key}>
                  <SidebarMenuButton 
                    onClick={() => handleNavigation(item.key, item.path)}
                    isActive={isActive(item.key, item.path)}
                    className="w-full justify-start gap-2 sm:gap-3 h-10 sm:h-12 rounded-lg transition-all hover:bg-accent data-[active=true]:bg-primary data-[active=true]:text-primary-foreground text-sm sm:text-base"
                  >
                    <item.icon className="w-4 h-4 sm:w-5 sm:h-5 shrink-0" />
                    <span className="font-medium truncate">{item.title}</span>
                  </SidebarMenuButton>
                </SidebarMenuItem>
              ))}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>

        <SidebarGroup className="mt-6 sm:mt-8">
          <SidebarGroupLabel className="text-xs uppercase tracking-wider text-muted-foreground mb-3 sm:mb-4">
            Profile
          </SidebarGroupLabel>
          <SidebarGroupContent>
            <SidebarMenu>
              {profileItems.map((item) => (
                <SidebarMenuItem key={item.key}>
                  <SidebarMenuButton 
                    onClick={() => handleNavigation(item.key, item.path)}
                    isActive={isActive(item.key, item.path)}
                    className="w-full justify-start gap-2 sm:gap-3 h-10 sm:h-12 rounded-lg transition-all hover:bg-accent data-[active=true]:bg-primary data-[active=true]:text-primary-foreground text-sm sm:text-base"
                  >
                    <item.icon className="w-4 h-4 sm:w-5 sm:h-5 shrink-0" />
                    <span className="font-medium truncate">{item.title}</span>
                  </SidebarMenuButton>
                </SidebarMenuItem>
              ))}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>

        <SidebarGroup className="mt-6 sm:mt-8">
          <SidebarGroupLabel className="text-xs uppercase tracking-wider text-muted-foreground mb-3 sm:mb-4">
            Account
          </SidebarGroupLabel>
          <SidebarGroupContent>
            <SidebarMenu>
              {bottomItems.map((item) => (
                <SidebarMenuItem key={item.key}>
                  <SidebarMenuButton 
                    onClick={() => handleNavigation(item.key, item.path)}
                    className="w-full justify-start gap-2 sm:gap-3 h-10 sm:h-12 rounded-lg transition-all hover:bg-accent text-sm sm:text-base"
                  >
                    <item.icon className="w-4 h-4 sm:w-5 sm:h-5 shrink-0" />
                    <span className="font-medium truncate">{item.title}</span>
                  </SidebarMenuButton>
                </SidebarMenuItem>
              ))}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>
      </SidebarContent>
      
      <SidebarFooter className="p-4 sm:p-6 border-t border-border">
        <div className="flex items-center gap-3">
          <div className="w-8 h-8 sm:w-10 sm:h-10 bg-muted rounded-full flex items-center justify-center shrink-0">
            <span className="text-xs sm:text-sm font-medium">JM</span>
          </div>
          <div className="flex-1 min-w-0">
            <p className="font-medium text-xs sm:text-sm truncate">Manager</p>
            <p className="text-xs text-muted-foreground truncate">john.manager@tsl.com</p>
          </div>
          <Bell className="w-3 h-3 sm:w-4 sm:h-4 text-muted-foreground shrink-0" />
        </div>
      </SidebarFooter>
    </Sidebar>
  )
}
