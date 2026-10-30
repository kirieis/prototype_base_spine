import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card"

export default function HomePage() {
  return (
    <div className="max-w-4xl mx-auto px-4 py-12">
      <div className="text-center mb-10">
        <h1 data-testid="home-title" className="text-4xl font-extrabold tracking-tight mb-3">
          SpendWise
        </h1>
        <p className="text-lg text-gray-600 max-w-2xl mx-auto">
          A small web app where each person records their own spending and sees how much they spent.
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <Card>
          <CardHeader>
            <CardTitle>Add expenses</CardTitle>
            <CardDescription>
              Quickly record any expense with categories, dates, and optional notes.
            </CardDescription>
          </CardHeader>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>Filter by month</CardTitle>
            <CardDescription>
              Easily filter your spending by specific months or categories to stay on track.
            </CardDescription>
          </CardHeader>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>See where money goes</CardTitle>
            <CardDescription>
              Get insights with summaries, totals, and breakdowns per spending category.
            </CardDescription>
          </CardHeader>
        </Card>
      </div>
    </div>
  )
}
