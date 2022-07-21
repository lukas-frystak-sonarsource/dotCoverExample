# Constants
$solution = ".\src\main.sln"
$coverageReportOutputPath = ".\TestResults\dotCover.Output.html"

# Build the solution
dotnet build $solution

# Run tests
dotnet dotcover test $solution --no-build --dcReportType=html --dcOutput=$coverageReportOutputPath
