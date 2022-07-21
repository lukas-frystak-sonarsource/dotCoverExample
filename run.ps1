# Constants
$solution = ".\src\main.sln"
$sonarQubeUrl = "http://localhost:9000"
$sonarQubeToken = ""
$projectKey = "example:dotCover"
$projectName = "Example: dotCover .NET Coverage"
$version = "1.0.0"
$branch = "dotCover-Setup"

$coverageReportOutputPath = ".\TestResults\dotCover.Output.html"

# Prepare analysis
dotnet sonarscanner begin `
    /key:$projectKey /name:$projectName /v:$version `
    /d:sonar.host.url=$sonarQubeUrl /d:sonar.login=$sonarQubeToken `
    /d:sonar.branch.name=$branch `
    /d:sonar.verbose=false

if (-not $?) {
    Write-Warning "Prepare analysis step failed!"
    Exit 1
}

# Build the solution
dotnet build $solution

# Run tests
#dotnet dotcover test $solution --no-build --dcReportType=html --dcOutput=$coverageReportOutputPath

# Run code analysis
dotnet sonarscanner end /d:sonar.login=$sonarQubeToken